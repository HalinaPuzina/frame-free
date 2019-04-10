<?php
namespace Controllers;

use app\Controller;
use app\Db;
use app\Mail;

class OrderController extends Controller
{
    private $data;

    function before(){
        $this->setPost();
        $this->data = $this->getPost();
    }

    public function create()
    {

        $this->before();
        if(!$this->data['email'] OR !filter_var($this->data['email'], FILTER_VALIDATE_EMAIL)){
            $this->ajax(['success'=>false,'message'=>'Нет  или не валидный  email','error'=>402]);
        }
        if($this->data['token'] !== $_SESSION['csrf_token']){
            $this->ajax(['success'=>false,'message'=>'CSRF Attack','error'=>400]);
        }
        if(!$this->data['place_id']){
            $this->ajax(['success'=>false,'message'=>'No place','error'=>404]);
        }
        $db = new Db();
        $query = 'SELECT count(id) as count from orders where orders.place_id = ?';
        $isBusy = $db->execute($query,[$this->data['place_id']]);
        if($isBusy[0]['count']){
            $this->ajax(['success'=>false,'message'=>'Wasted… Пробуй другое место.','error'=>403]);
        }
        $query = 'SELECT count(email) as count from orders where orders.email = ? group  by email';
        $hasEmail = $db->execute($query,[$this->data['email']]);
        if($hasEmail[0]['count']){
            $this->ajax(['success'=>false,'message'=>'Двойников не принимаем!','error'=>401]);
        }
        $code = (int)str_pad($this->data['place_id'],6,'9',STR_PAD_LEFT);
        $query = 'INSERT INTO orders (email,place_id,code) values (:email,:place_id,:code)';
        $db->execute($query,[':email'=>$this->data['email'],':place_id'=>$this->data['place_id'],':code'=>$code]);

        $body = $this->view('Mail/OrderMail.twig')->render(['place_id'=>$this->data['place_id'],'code'=>$code]);
        $mail = new Mail();
        $mail->send($this->data['email'],'You order place in our course',$body);

        $this->ajax(['success'=>true,'message'=>'Все ништяк! Ждем тебя, братишка ^_^']);
    }
}