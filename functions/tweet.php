<?php
	include ("common.php");

	header('Accept: application/json');
	header('Content-Type: application/json');
	function buildBaseString($baseURI, $method, $params) {
	    $r = array();
	    ksort($params);
	    foreach($params as $key=>$value){
	        $r[] = "$key=" . rawurlencode($value);
	    }
	    return $method."&" . rawurlencode($baseURI) . '&' . rawurlencode(implode('&', $r));
	}

	function buildAuthorizationHeader($oauth) {
	    $r = 'Authorization: OAuth ';
	    $values = array();
	    foreach($oauth as $key=>$value)
	        $values[] = "$key=\"" . rawurlencode($value) . "\"";
	    $r .= implode(', ', $values);
	    return $r;
	}

	function returnTweet($username){
	     $oauth_access_token = "821228179834609665-d92MHlUpBi9Il1ffMeVP3AFFflcwPLS";
	    $oauth_access_token_secret = "3yx3WSE6uXPiUFuIr8wYpMMcjarcpuO9LCmDNA7QEjMN0";
	    $consumer_key = "ozZHwojtFPpfRPU1tA5VadOs0";
	    $consumer_secret = "DEgWiKQy5SmRe9RNvpI3lWW29xn3DjPWGCuUmhJEYCdxxLRGFK";
	    $twitter_timeline           = "user_timeline";  

	        $request = array(
	            'screen_name'       => $username, // Change Username as you want
	            'count'=>5000
	        );

	    $oauth = array(
	        'oauth_consumer_key'        => $consumer_key,
	        'oauth_nonce'               => time(),
	        'oauth_signature_method'    => 'HMAC-SHA1',
	        'oauth_token'               => $oauth_access_token,
	        'oauth_timestamp'           => time(),
	        'oauth_version'             => '1.0'
	    );

	    //  merge request and oauth to one array
	        $oauth = array_merge($oauth, $request);

	    //  do some magic
	        $base_info              = buildBaseString("https://api.twitter.com/1.1/statuses/$twitter_timeline.json", 'GET', $oauth);
	        $composite_key          = rawurlencode($consumer_secret) . '&' . rawurlencode($oauth_access_token_secret);
	        $oauth_signature            = base64_encode(hash_hmac('sha1', $base_info, $composite_key, true));
	        $oauth['oauth_signature']   = $oauth_signature;

	    //  make request
	        $header = array(buildAuthorizationHeader($oauth), 'Expect:');
	        $options = array( CURLOPT_HTTPHEADER => $header,
	                          CURLOPT_HEADER => false,
	                          CURLOPT_URL => "https://api.twitter.com/1.1/statuses/$twitter_timeline.json?". http_build_query($request),
	                          CURLOPT_RETURNTRANSFER => true,
	                          CURLOPT_SSL_VERIFYPEER => false,
	                           CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36',
	                        
	                     );

	        $feed = curl_init();	
	        curl_setopt_array($feed, $options);
	        $json = curl_exec($feed);
	        curl_close($feed);

	    return $json;
	}

    $db = new MyDB();

    $query = "SELECT * FROM twitter";
    $result = mysqli_query($db->dblink, $query);

    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
        $users[] = $row;
    }

    $query = "DELETE FROM ttweets";
    mysqli_query($db->dblink, $query);
    foreach ($users as $user) {
    	$tName = $user['tName'];
    	$tweets = returnTweet($tName);
    	$tweets = json_decode($tweets);
    	
    	// check the twitter data is correct
    	$hasval = 1;
    	foreach ($tweets as $key => $value) {
    		if ($key != '0') {
    			echo "'".$tName."' is not Twitter user.\n";
    			$hasval = 0;	
    		}
    		break;
    	}
    	if ($hasval == 0)
    		continue;
    	//----------------------------------------

		//--------update twitter table------------
   		$userdata = $tweets[0];
		$userdata = $userdata->user;
    	$tFollowers = $userdata->followers_count;
    	$tTweets = $userdata->statuses_count;
    	$tFollowings = $userdata->friends_count;
    	$tLikes = $userdata->favourites_count;
    	$query = "UPDATE twitter SET tFollowers = $tFollowers, tFollowings = $tFollowings, tTweets = $tTweets, tLikes=$tLikes WHERE tName = '$tName'";
        mysqli_query($db->dblink, $query);
        //-------------------------------------------
        
        //--------update ttweets table--------------
        foreach ($tweets as $tweet) {
            $tDate = $tweet->created_at;
            $tDate = date('Y-m-d',strtotime($tDate));
            $tContent = $tweet->text;
            $tRetweets = $tweet->retweet_count;
            $tLikes = $tweet->favorite_count;
            $tText = $tweet->text;
            $query = "INSERT INTO ttweets (tName, tDate, tLikes, tRetweets, tContent) VALUES ('$tName', '$tDate', $tLikes, $tRetweets, '$tText')";
            mysqli_query($db->dblink, $query);
        }
        //------------------------------------------
    }

?>