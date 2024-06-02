<?php

// $host = 'localhost';
// $dbuser = 'postgres';
// $password = 'eka12345';
// $port = '5432';
// $dbname ='webKasir';

$connection = pg_connect("host=db dbname=webKasir user=postgres password=eka12345");
if (!$connection) {
    echo "An Error occured";
    exit;
}
