<?php

namespace Controllers;

use  app\Controller;

class HomeController extends Controller
{
    public function index ()
    {
        if (! isset($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = base64_encode(openssl_random_pseudo_bytes(32));
        }
        return $this->view('Home.twig')->render(['csrf_token' => $_SESSION['csrf_token']]);
    }
}