<?php
$root = preg_replace('/(\\\|\\/)config?/','',__DIR__);
$host = preg_replace('/(\\\|\\/)[app|config]+/','',__DIR__);

define('ROOTPATH', $root );

define('HOST', $host );

define('MAIL_HOST','smtp.mailtrap.io');

define('MAIL_LOGIN','c9157590b051cf');

define('MAIL_PASSWORD','eae7d5ec1ec6e8');

define('MAIL_PORT',2525);

define('MAIL_FROM_ADDRESS','from@example.com');

define('MAIL_FROM_NAME','Example');


