-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 14 2020 г., 12:16
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `strata_options_calculator`
--

-- --------------------------------------------------------

--
-- Структура таблицы `calculator_details`
--

CREATE TABLE `calculator_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `calculator_details`
--

INSERT INTO `calculator_details` (`id`, `name`) VALUES
(1, 'Approximate value of property'),
(2, 'Type of day-to-day supervision'),
(3, 'Underground parking'),
(4, 'Number of lifts'),
(5, 'Residential or commercial'),
(6, 'Number of units in the building'),
(7, 'Age of building');

-- --------------------------------------------------------

--
-- Структура таблицы `calculator_properties`
--

CREATE TABLE `calculator_properties` (
  `id` int(11) NOT NULL,
  `property_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_value` int(11) NOT NULL,
  `value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `calculator_properties`
--

INSERT INTO `calculator_properties` (`id`, `property_description`, `property_value`, `value_id`) VALUES
(1, '<$500,000\r\n', 450, 1),
(2, 'Between $500,000 and $600,000\r\n', 550, 1),
(3, 'Between $600,000 and $700,000\r\n', 650, 1),
(4, 'Between $700,000 and $800,000\r\n', 750, 1),
(5, 'Between $800,000 and $1,000,000\r\n', 900, 1),
(6, 'Between $1,000,000 and $1,200,000\r\n', 1100, 1),
(7, 'Between $1,200,000 and $1,500,000\r\n', 1300, 1),
(8, 'Between $1,500,000 and $2,000,000\r\n', 1750, 1),
(9, 'Over $2,000,000\r\n', 2250, 1),
(10, 'No-one particularly\r\n', 3, 2),
(11, 'A lot owner\r\n', 2, 2),
(12, 'The executive committee\r\n', 1, 2),
(13, 'The strata manager\r\n', 6, 2),
(14, 'Part time facilities manager or building manager\r\n', 7, 2),
(15, 'Full time facilities manager or building manager\r\n', 8, 2),
(16, 'Other\r\n', 1, 2),
(17, 'No\r\n', 0, 3),
(18, 'Yes', 1, 3),
(19, '0\r\n', 0, 4),
(20, '1', 1, 4),
(21, '2', 2, 4),
(22, '3', 3, 4),
(23, '4', 4, 4),
(24, '5', 5, 4),
(25, '>5', 6, 4),
(26, 'Residential\r\n', 0, 5),
(27, 'Residential & Commercial\r\n', 1, 5),
(28, '2-6\r\n', 0, 6),
(29, '7-12\r\n', 0, 6),
(30, '13-20\r\n', 0, 6),
(31, '21-40\r\n', 0, 6),
(32, '41-60\r\n', 0, 6),
(33, '61-80\r\n', 0, 6),
(34, '81-100\r\n', 0, 6),
(35, '101-150\r\n', 0, 6),
(36, '151-200\r\n', 0, 6),
(37, '201-300\r\n', 0, 6),
(38, '301-400\r\n', 0, 6),
(39, '>400\r\n', 0, 6),
(40, 'less than 1 year old\r\n', 1, 7),
(41, 'less than 3 years old\r\n', 2, 7),
(42, 'less than 5 years old\r\n', 3, 7),
(43, 'less than 7 years old\r\n', 4, 7),
(44, 'less than 10 years old\r\n', 5, 7),
(45, 'less than 15 years old\r\n', 6, 7),
(46, 'less than 20 years old\r\n', 7, 7),
(47, 'More than 20 years old\r\n', 8, 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `calculator_details`
--
ALTER TABLE `calculator_details`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `calculator_properties`
--
ALTER TABLE `calculator_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_details_id` (`value_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `calculator_details`
--
ALTER TABLE `calculator_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `calculator_properties`
--
ALTER TABLE `calculator_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `calculator_properties`
--
ALTER TABLE `calculator_properties`
  ADD CONSTRAINT `fk_details_id` FOREIGN KEY (`value_id`) REFERENCES `calculator_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
