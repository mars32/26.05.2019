-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 22 2019 г., 18:36
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `13_12_18_ilyash`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'наименование категории',
  `category_parent` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_parent`) VALUES
(1, 'Мужчинам', '0'),
(2, 'Женщинам', '0'),
(3, 'Детям', '0'),
(4, 'Куртки', '1'),
(5, 'Обувь', '1'),
(6, 'Брюки', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL COMMENT 'номер заказа',
  `excurtion_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'наименование экскурсии',
  `qantity_person` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT 'количество человек',
  `user_id` int(10) NOT NULL COMMENT 'id пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `excurtion_name`, `qantity_person`, `user_id`) VALUES
(1, 'Крыши Петербурга', '3', 222),
(2, 'frfrfrf', '3', 222),
(3, '', '5', 0),
(4, 'Петербург наизнанку', '5', 0),
(5, '', '0', 0),
(6, '', '0', 0),
(7, 'Тайны Петербурга', '2', 0),
(8, 'Тайны Петербурга', '2', 0),
(9, 'Петербург наизнанку', '1', 0),
(10, 'крышы', '3', 0),
(11, 'цуцуцуцу', '2', 333),
(12, 'Крыши Петербурга', '4', 72),
(13, 'Петербург наизнанку', '4', 73),
(14, 'Петербург наизнанку', '4', 74),
(15, 'На теплоходе по \"Северной Венеции\"', '2', 75),
(16, 'На теплоходе по \"Северной Венеции\"', '2', 76),
(17, 'На теплоходе по \"Северной Венеции\"', '2', 77),
(18, 'На теплоходе по \"Северной Венеции\"', '3', 78),
(19, 'На теплоходе по \"Северной Венеции\"', '3', 79),
(20, 'На теплоходе по \"Северной Венеции\"', '3', 80),
(21, 'На теплоходе по \"Северной Венеции\"', '3', 81),
(22, 'На теплоходе по \"Северной Венеции\"', '3', 82),
(23, 'На теплоходе по \"Северной Венеции\"', '3', 83),
(24, 'На теплоходе по \"Северной Венеции\"', '3', 84),
(25, 'На теплоходе по \"Северной Венеции\"', '3', 85),
(26, 'Крыши Петербурга', '3', 86),
(27, 'Петербург наизнанку', '4', 87),
(28, 'Петербург наизнанку', '4', 88),
(29, 'Петербург наизнанку', '4', 89);

-- --------------------------------------------------------

--
-- Структура таблицы `product_catalog`
--

CREATE TABLE `product_catalog` (
  `product_id` int(10) NOT NULL COMMENT 'продукт ID',
  `product_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'наименование продукта',
  `product_prise` int(10) NOT NULL COMMENT 'цена продукта',
  `product_img` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'изображение продукта',
  `category_id` int(10) NOT NULL COMMENT 'категория товара'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `product_catalog`
--

INSERT INTO `product_catalog` (`product_id`, `product_name`, `product_prise`, `product_img`, `category_id`) VALUES
(1, 'Куртка кожанная', 25000, '1.jpg', 4),
(2, 'Куртка синяя', 23000, '2.jpg', 4),
(3, 'Куртка с карманами', 17000, '3.png', 4),
(4, 'Куртка с капюшоном', 14000, '4.jpg', 4),
(5, 'Куртка Casual', 15500, '5.jpg', 4),
(6, 'Стильная кожанная куртка', 19700, '6.jpg', 4),
(7, 'Кеды серые', 4500, '7.jpg', 5),
(8, 'Кеды черные', 4500, '8.jpg', 5),
(9, 'Кеды Casual', 3000, '9.jpg', 5),
(10, 'Кеды Всепогодные', 4500, '10.jpg', 5),
(11, 'Джинсы', 6500, '11.jpg', 6),
(12, 'Джинсы Голубые', 6700, '12.jpg', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'id пользователя',
  `name` varchar(100) NOT NULL COMMENT 'Имя пользователя',
  `email` varchar(30) NOT NULL COMMENT 'Email пользователя',
  `pfone` varchar(16) NOT NULL COMMENT 'Номер телефона пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица пользователей';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `pfone`) VALUES
(1, 'Григорий', 'test@test.ru', '495 555 55 55'),
(2, 'test', 'test2@test.ru', '926 5556644'),
(3, 'user', 'user@test.ru', '812 000-00-00'),
(4, 'Саша Тест', 'sashatest@test.ru', '812 999 99 99'),
(46, 'Eeeeeeeeeee', 'asasa@dsdsd', '33333333333'),
(47, 'Eeeeeeeeeee', 'asasa@dsdsd', '33333333333'),
(48, 'Григорий', 'iof77@test.ru', '555664433'),
(49, 'Григорий', 'iof77@test.ru', '555664433'),
(50, 'Григорий', 'iof77@test.ru', '555664433'),
(51, 'Григорий', 'iof77@test.ru', '555664433'),
(52, 'Григорий', 'iof77@test.ru', '555664433'),
(53, 'Григорий', 'iof77@test.ru', '555664433'),
(54, 'Григорий', 'iof77@test.ru', '555664433'),
(55, 'Григорий', 'iof77@test.ru', '555664433'),
(56, 'Григорий', 'iof77@test.ru', '555664433'),
(57, 'Григорий', 'iof77@test.ru', '555664433'),
(58, 'Григорий', 'iof77@test.ru', '555664433'),
(59, 'Григорий', 'iof77@test.ru', '555664433'),
(60, 'Григорий', 'iof77@test.ru', '555664433'),
(61, 'Григорий', 'iof77@test.ru', '555664433'),
(62, 'Григорий', 'iof77@test.ru', '555664433'),
(63, 'Григорий', 'iof77@test.ru', '555664433'),
(64, 'Григорий', 'iof77@test.ru', '555664433'),
(65, 'Григорий', 'iof77@test.ru', '555664433'),
(66, 'Григорий', 'iof77@test.ru', '555664433'),
(67, 'Григорий', 'iof77@test.ru', '555664433'),
(68, 'Григорий', 'iof77@test.ru', '555664433'),
(69, 'Григорий', 'iof77@test.ru', '555664433'),
(70, 'Григорий', 'iof77@test.ru', '555664433'),
(71, 'Григорий', 'iof77@test.ru', '555664433'),
(72, 'Григорий', 'iof77@test.ru', '555664433'),
(73, 'Григорий', 'iof77@test.ru', '555664433'),
(74, 'Григорий', 'iof77@test.ru', '555664433'),
(75, 'Григорий', 'iof_77@land.ru', '333333'),
(76, 'Григорий', 'iof_77@land.ru', '333333'),
(77, 'Григорий', 'iof_77@land.ru', '333333'),
(78, 'Григорий', 'iof77@test.ru', '55555555'),
(79, 'Григорий', 'iof77@test.ru', '55555555'),
(80, 'Григорий', 'iof77@test.ru', '55555555'),
(81, 'Григорий', 'iof77@test.ru', '55555555'),
(82, 'Григорий', 'iof77@test.ru', '55555555'),
(83, 'Григорий', 'iof77@test.ru', '55555555'),
(84, 'Григорий', 'iof77@test.ru', '55555555'),
(85, 'Григорий', 'iof77@test.ru', '55555555'),
(86, 'Ddfdfdsfds', 'fdf@dsdsd', '111111222'),
(87, 'Григорий', 'iof77@test.ru', '22222'),
(88, 'Григорий', 'iof77@test.ru', '22222'),
(89, 'Григорий', 'iof77@test.ru', '22222');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `product_catalog`
--
ALTER TABLE `product_catalog`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'номер заказа', AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `product_catalog`
--
ALTER TABLE `product_catalog`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'продукт ID', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id пользователя', AUTO_INCREMENT=90;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
