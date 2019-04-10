'use strict';
document.addEventListener("DOMContentLoaded", ready);
import MicroModal from 'micromodal';
let placeId = 0;
function ready() {
    fetch('/placeController/get',{method: 'GET', headers: {'Content-Type': 'application/json' }})
       .then(response => response.json())
       .then(data => {
           if(data.success){
               for(var i=0; i<data.data.length; i++){
                   var div = document.createElement('div');
                   div.className = 'place ' + data.data[i].class;
                   div.title = data.data[i].name;
                   var state = 'free'
                   if(data.data[i].class === 'coach' || data.data[i].busy){
                       state = 'busy';
                   };
                   div.innerHTML ='<div id="'+data.data[i].id.toString()+'" class="'+ state +'"></div>';
                   document.getElementById('map').appendChild(div);
               }
           };
       })
       .catch(error => console.error(error))



    var map = document.querySelector('#map');
    map.addEventListener('click',function (event) {
        event.preventDefault();
        if(event.target.classList.contains('free')){
            placeId = event.target.id;
            message.className = "message"; // Сбросить визуальное состояние сообщения
            document.querySelector('.image').className = 'image not-show';
            MicroModal.show('order-form-modal');
        };
    });

    var submit = document.querySelector('.submit');
    var email = document.querySelector('#email');
    var message = document.querySelector('.message');
    var csrf_token = document.querySelector('#token');

    email.addEventListener("input", function (event) {
        // Каждый раз, когда пользователь вводит что-либо, мы проверяем,
        // является ли корректным поле электронной почты.
        if (email.validity.valid) {
            // В случае появления сообщения об ошибке, если поле
            // является корректным, мы удаляем сообщение об ошибке.
            document.querySelector('.message-text').innerHTML = ""; // Сбросить содержимое сообщения
            message.className = "message"; // Сбросить визуальное состояние сообщения
        }
    }, false);

    submit.addEventListener("click", function (event) {
        // Каждый раз, когда пользователь пытается отправить данные, мы проверяем
        // валидность поля электронной почты.
        if (!email.validity.valid) {

            // Если поле невалидно, отображается пользовательское
            // сообщение об ошибке.
            document.querySelector('.message-text').innerHTML  = "Введите валидный email!";
            message.className = "message error";
            // И мы предотвращаем отправку формы путем отмены события
            event.preventDefault();
        }else{
            doOrder(email.value, placeId, csrf_token.value);
        }
    }, false);
};

function doOrder(email,placeId, csrf_token) {
    var data ={};
    data.email = email;
    data.place_id = placeId;
    data.token = csrf_token;

    postRequest('/orderController/create', data)
        .then(data => {
            if(data.success){
                var place = document.getElementById(placeId);
                place.classList.remove('free');
                place.classList.add('busy');
                document.querySelector('.message-text').innerHTML = data.message;
                document.querySelector('.message').className = "message success";
            }else{
                document.querySelector('.message-text').innerHTML = data.message;
                document.querySelector('.message').className = "message error";
                if(data.error === 403){
                    var place = document.getElementById(placeId);
                    place.classList.remove('free');
                    place.classList.add('busy');
                    document.querySelector('.image').className ='image show';
                };
            };
        } ) // Result from the `response.json()` call
        .catch(error => console.error(error))

    function postRequest(url, data) {
        return fetch(url, {
            credentials: 'same-origin', // 'include', default: 'omit'
            method: 'POST', // 'GET', 'PUT', 'DELETE', etc.
            body: JSON.stringify(data), // Coordinate the body type with 'Content-Type'
            headers: new Headers({
                'Content-Type': 'application/json'
            }),
        })
            .then(response => response.json())
    }
}


