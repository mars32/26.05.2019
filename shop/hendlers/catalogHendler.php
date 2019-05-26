<?php

include($_SERVER['DOCUMENT_ROOT'] .'/SHOP/db/coneckt.php');  //  инклюдим файл конектор ( с настройками подключения к БД )

sleep(5);

// $query = "SELECT * FROM `product_catalog`";    // строим запрос к БД с нужной таблицей

// $result = mysqli_query( $db, $query );        //отправляем запрос $query в БД $db и сохраняем ответ в переменную $result

// // echo ('<pre>');
// //     print_r( mysqli_fetch_assoc($result) );  // print_r - отображаем массив , mysqli_fetch_assoc - в асоциативном виде 
// // echo ('</pre>');

// $items =[];

// while ( $row = mysqli_fetch_assoc($result) ) {   // запускаем цикл (while с условием (mysqli_fetch_assoc), результат записываем переменную $row

//     // далее наполняем массив любым из двух способов
   
//     $items[] = $row; // № 1

//     // array_push( $items , $row  ) // № 2
// }

// echo json_encode( $items );  // выводим ответ в формате JSON  !! ответ от сервера может быть только один

// // JSON - формат данных подходящих для JS

$id = $_GET['id'];  // получаем искомое значение
// $idsub = $_GET['sub'];

// print_r($_GET);

$query = "SELECT * FROM `categories` WHERE `id` = $id";  //  создаем запрос к базе и ищем категорий с ИД = $id

$result = mysqli_query( $db, $query ); //получаем результат

$cat =  mysqli_fetch_assoc($result ); // выводим в ассоциативное значение

$cat = $cat['category_parent']; //  записываем в переменную , значение поля 'category_parent', у категорий с ИД = $id 

$items =[]; // создаем пустой массив для товаров

if ( $cat == 0) {  // задаем условие если 'category_parent' == 0 т.е. $cat = является родительским каталогом , выполняем следущее

    $query = "SELECT * FROM `categories` WHERE `category_parent` = $id "; // строим запрос к базе и выбираем дочерние категории `category_parent` = $id
    
    $result = mysqli_query( $db, $query );                               // получаем результат

    $children =[];                                                      // создаем пустой массив для дочерних категорий

    while ( $row = mysqli_fetch_assoc($result ) ) {                     //перебираем $result приводя его в ассоциативное значение и записываем в переменную $row
       
        $children[] = $row['id'];           // добавляем результаты в массив
    
    }
  
    $cats = implode (',', $children);                         // приводит массив в строчку
    
    // explode (',', $children);                             // приводит  строчку в массив с разделителем 

    $query = "SELECT * FROM `product_catalog` WHERE `category_id` IN ( $cats )"; // оправляем запрос в базу с несколькими $id
    //echo $query;
    $result = mysqli_query( $db, $query ); 

    $items = []; 
    
    while ( $row = mysqli_fetch_assoc( $result ) ) { 
 
        $items[] = $row; 

    }
    // print_r( $items);
    // echo json_encode( $items ); // выдаем ответ с найдеными дочерними категориями
    
}

else { 
    $items = [];

    $query = "SELECT * FROM `product_catalog` WHERE `category_id`= $id ";
    //echo $query;
    $result = mysqli_query( $db, $query ); 
        
    while ( $row = mysqli_fetch_assoc( $result ) ) { 
    
        $items[] = $row; 
    }
    
}

echo json_encode( $items );



// while ( $row = mysqli_fetch_assoc($result ) ) { 

//     // далее наполняем массив любым из двух способов
   
//     $items[] = $row; // № 1

//     // array_push( $items , $row  ) // № 2
// }

// echo json_encode( $items ); 


?>