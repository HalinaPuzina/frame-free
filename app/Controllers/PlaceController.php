<?php

namespace Controllers;

use app\Controller;
use app\Db;

class PlaceController extends Controller
{
    public function get()
    {
        $db = new Db();
        $query = 'SELECT places.id, places.`name`, places.class, orders.id as busy
                  FROM places
                     LEFT JOIN orders on places.id = orders.place_id
                  ORDER BY places.id';
        $result = $db->execute($query);
        if($result){
            $data =[];
            foreach ($result as $key=>$item){
                $data['data'][] = [
                    'id' => $item['id'],
                    'name'=> $item['name'],
                    'class' => $item['class'],
                    'busy' => $item['busy']
                    ];
            }
            $data['success'] = true;
            $this->ajax($data);

        }else {
            $this->ajax(['message'=>'Нет данных',
                'success' => false]);
        }

    }
}