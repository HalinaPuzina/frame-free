<?php

namespace App;

use \Twig\Loader\FilesystemLoader;
use \Twig\Environment;

class Controller
{
    protected $loader,$twig;
    protected $post;


    public function view ($viewName)
    {
        $this->loader = new FilesystemLoader(HOST.DIRECTORY_SEPARATOR.'Views');
        $this->twig = new Environment($this->loader);
        return $this->twig->load($viewName);
    }

    public function ajax($data)
    {
        echo json_encode($data);
        die;
    }

    protected function setPost(){
        if($_POST){
            $this->post = $_POST;
        }else{
            $inputJSON = file_get_contents('php://input');
            $this->post= json_decode( $inputJSON, TRUE ); //convert JSON into array
        }
    }

    protected function getPost(){
        return $this->post;
    }
}