<?php header('Access-Control-Allow-Origin: *'); ?>
<?php
    include ("common.php");

    $db = new MyDB();

    $query = "SELECT * FROM Instagram";
    $result = mysqli_query($db->dblink, $query);

    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
        $users[] = $row;
    }

    $query = "DELETE FROM igposts";
    mysqli_query($db->dblink, $query);
    foreach ($users as $user) {
        //extract data from the post
        //set POST variables
        $url = 'https://getigdata.com/Instagram/getuser';
        $fields = array(
            "username" => $user['igName']
        );

        //url-ify the data for the POST
        $fields_string = null;
        foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
        $fields_string = rtrim($fields_string, '&');
        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, count($fields));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        //execute post
        $result = curl_exec($ch);
        $result = json_decode($result);
        $igName = $user['igName'];

        //--------update instagram table------------
        $insta_account = $result->insta_account[0];
        $followers = $insta_account->followers;
        $following = $insta_account->following;
        $posts = $insta_account->posts;
        $query = "UPDATE instagram SET igFollowers = $followers, igFollowings = $following, igPosts = $posts WHERE igName = '$igName'";
        mysqli_query($db->dblink, $query);
        //------------------------------------------

        //--------update igposts table--------------
        $posts = $result->post;
        foreach ($posts as $post) {
            $post_date = $post->post_date;
            $likes = $post->likes;
            $comments = $post->comments;
            $post_path = $post->post_path;
            $query = "INSERT INTO igposts (igName, pDate, pLikes, pComments, pURL) VALUES ('$igName', '$post_date', $likes, $comments, '$post_path')";
            mysqli_query($db->dblink, $query);
        }
        //------------------------------------------

        //close connection
        curl_close($ch);
    }

?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
/*    $.ajax({
        url: 'https://getigdata.com/Instagram/getuser',
        type: 'post',
        data: {username: 'nike'},
        success: function(ret){
            var data=ret;
        }
    })*/
</script>