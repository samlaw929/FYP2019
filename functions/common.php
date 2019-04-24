<?php
	class MyDB
	{
		public $dblink;
		
		function __construct()
		{
			$this->dblink = mysqli_connect("localhost", "root", "", "social");
		}
		
		function __destruct() {
			mysqli_close($this->dblink);
		}
	
	}

?>