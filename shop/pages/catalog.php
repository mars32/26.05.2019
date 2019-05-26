<?php 
include($_SERVER['DOCUMENT_ROOT'] .'/SHOP/db/coneckt.php');



if ( isset($_GET['id']) ) {
    $cat = $_GET['id'];

}
else { $cat=1; }

$query = "SELECT * FROM `categories` WHERE `category` = $cat ";

//выбор родительских категорий ____________________________________________________________

$query = "SELECT * FROM `categories` WHERE `category_parent` = 0 ";

$result = mysqli_query( $db, $query );

$template =[];

while ( $row = mysqli_fetch_assoc($result) ) {

    $template['cats'][] = $row;                             // наполняем массив 
    
}

//выбор дочерних категорий __________________________________________________________________

$query = "SELECT * FROM `categories` WHERE `category_parent` = 0 ";

$result = mysqli_query( $db, $query );

$template =[];

while ( $row = mysqli_fetch_assoc($result) ) {

    $template['cats'][] = $row;                              // наполняем массив 
    
}

$catName = ' ';

foreach( $template['cats'] as $key => $value ) {

    if ( $cat == $value['id'] ) {

        $catName = $value['category_name'];

        break;
    }
}

$query = "SELECT * FROM `categories` WHERE `category_parent` = $cat ";

$result = mysqli_query( $db, $query );

while ( $row = mysqli_fetch_assoc($result) ) {

    $template['children'][] = $row;                              // наполняем массив 
    
}

// далее запрос покатегорий дочерних товаров ___________________________________________________________

// $query = "SELECT * FROM `product_catalog` WHERE `category_id` = $cat ";

// $result = mysqli_query( $db, $query );

// while ( $row = mysqli_fetch_assoc($result) ) {

//     $template['subchildren'][] = $row;         // наполняем массив 
    
// }

// echo ('<pre>');
//     print_r( $template );  // print_r - отображаем массив , mysqli_fetch_assoc - в асоциативном виде 
// echo ('</pre>');

?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../styles/dest/style.css">
    <title>Каталог товаров</title>
</head>
<body>


    <div class='wraper'>
        <header class='header'>
            <div class="block-logo-nav">
                <div class="logo logo_margin-right"></div>
                <nav class="navigation">

                <?php foreach( $template['cats'] as $key => $value): ?>

                    <a href="/shop/pages/catalog.php?id=<?= $value['id'] ?>" class="navigation__item"> <?= $value['category_name']  ?> </a>

                <?php endforeach; ?>

                    <a href="#" class="navigation__item">Новинки</a>
                    <a href="#" class="navigation__item">О нас</a>
                </nav>
            </div>

            <div class="header__loginbasket">
                <div class="header__loginbasket__login">
                    <div class="header__loginbasket__login__ico"></div>
                    <p class="header__loginbasket__login__txt">
                        Привет, Алексей (<a href="#" class="main-link main-link_orange">выйти</a>) 
                    </p>
                </div>
                <div class="header__loginbasket__bascet">
                    <div class="header__loginbasket__bascet__ico"></div>
                    <p class="header__loginbasket__bascet__text">
                        Корзина (5) 
                    </p>
                </div>
            </div>


        </header>

        <div class="">Главная</div>

        <div class="block-sector-line">
            <h2 class="block-sector-line__h2"> <?= $catName ?></h2>
            <p class="block-sector-line__p">Все товары</p>
        </div>

        <div class="block-selection">
            <select class="block-selection__categori" name="categori" >
                <option hidden value="0">Категория</option>

                <?php foreach ( $template['children'] as $key => $value): ?>
                    <option value="<?= $value['id'] ?>"> <?= $value['category_name'] ?> </option> 
                <?php endforeach; ?> 

            </select>

            <select class="block-selection__size" name="size">
                <option value="0" selected>Размер</option> 
                <option value="40" >40</option> 
                <option value="42">42</option> 
                <option value="44">44</option>
                <option value="46" >46</option> 
                <option value="48">48</option> 
                <option value="50">50</option>              
            </select>

            <select class="block-selection__price" name="price">
                <option value="0" selected>Стоимость</option> 
                <option value="0-1000 руб." >0-1000</option> 
                <option value="1000-3000 руб.">1000-3000</option> 
                <option value="3000-6000 руб.">3000-6000</option>
                <option value="6000 руб. >">6000 ></option>             
            </select>
        </div>

        <div class="block-product-list flex-cont">
            
        </div>

        <div class="block-page-list flex-cont">
            <div class="block-page-list__namber">1</div>
            <div class="block-page-list__namber">2</div>
            <div class="block-page-list__namber">3</div>
            <div class="block-page-list__namber">4</div>
        </div>

        <!-- блок футер -->

        <div class="block-futer flex-cont">
            <div class="block-futer__el block-futer__el_left">
                <h3 class="block-futer__el__h3">Колекции</h3>
                <nav class="navigation block-futer__el__navigation">
            
                    <?php foreach( $template['cats'] as $key => $value): ?>
                       <a href="/pages/catalog.php?id=<?= $value['id'] ?>" class="navigation__item"> <?= $value['category_name']  ?> </a>
                    <?php endforeach; ?>

                    <a href="#" class="navigation__item">Новинки</a>
                  
                </nav>
            </div>
            <div class="block-futer__el block-futer__el_center">
                <h3 class="block-futer__el__h3">Магазин</h3>
                <nav class="navigation block-futer__el__navigation_center ">
                        <a href="#" class="navigation__item">О нас</a>
                        <a href="#" class="navigation__item">Доставка</a>
                        <a href="#" class="navigation__item">работай с нами</a>
                        <a href="#" class="navigation__item">Контакты</a> 
                    </nav>
            </div>
            <div class="block-futer__el block-futer__el_right">
                <h3 class="block-futer__el__h3">Мы в социальных сетях</h3>
                <p class="block-futer__el__p">
                    Сайт разработан в INORDIC.RU 2018 <br>
                    © Все права защищены</p>
            </div>
        </div>


    </div>
    <script src="../js/catalog.js"></script>
</body>

</html>