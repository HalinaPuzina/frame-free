<?php

/*
|--------------------------------------------------------------------------
| Register The Auto Loader
|--------------------------------------------------------------------------
|
| Composer provides a convenient, automatically generated class loader for
| our application. We just need to utilize it! We'll simply require it
| into the script here so that we don't have to worry about manual
| loading any of our classes later on. It feels great to relax.
|
*/

ini_set('display_errors', 'off'); // Display all errors on screen
error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
header("Cache-Control: public");
header("Expires: " . date("r", time() + 3600));
header('Content-Type: text/html; charset=UTF-8');
ob_start();

require __DIR__.'/../vendor/autoload.php';

require __DIR__.'../../app/App.php';

require  __DIR__.'../../app/config/Env.php';

@session_start();

App::init();
App::$kernel->launch();