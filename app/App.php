<?php

class App
{
    public static $router;

    public static $db;

    public static $kernel;

    public static $mail;


    public static function init()
    {
        spl_autoload_register(['static','loadClass']);
        static::bootstrap();
        set_exception_handler(['App','handleException']);

    }

    public static function bootstrap()
    {
        static::$router = new app\Router();
        static::$kernel = new app\Kernel();
        static::$db = new app\Db();
        static::$mail = new app\Mail();

    }

    public static function loadClass ($className)
    {
        $className = str_replace('\\', DIRECTORY_SEPARATOR, $className);
        include DIRECTORY_SEPARATOR.HOST.DIRECTORY_SEPARATOR.$className.'.php';

    }

    public function handleException (Throwable $e)
    {

        if($e instanceof \Exceptions\InvalidRouteException) {
            echo static::$kernel->launchAction('Error', 'error404', [$e]);
        }else{
            echo static::$kernel->launchAction('Error', 'error500', [$e]);
        }

    }
}