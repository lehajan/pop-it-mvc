-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 17 2024 г., 06:49
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(12, 'Спорт'),
(13, 'наука');

-- --------------------------------------------------------

--
-- Структура таблицы `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`) VALUES
(18, 'Физ-ра'),
(19, 'География'),
(20, 'Биология'),
(21, 'География Томской области'),
(22, 'Алгебра'),
(23, 'Геометрия');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `firt_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `img_photo` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `firt_name`, `last_name`, `patronymic`, `gender`, `address`, `post_id`, `department_id`, `birthday`, `img_photo`) VALUES
(21, 'Максим', 'Ёлохов', 'Вадимович', 1, 'Сибирская 102', 2, 12, '2002-04-22', ''),
(22, 'Алексей', 'Солдатов', 'Романович', 1, 'Мира 49', 3, 13, '2993-03-11', ''),
(30, 'Рудольф', 'Иванов', 'Сергеевич', 0, 'Красноармейска 85', 4, 13, '2024-01-01', ''),
(31, 'Иванов', 'Иван', 'Иванович', 1, 'Обручева 1', 5, 13, '2005-03-12', ''),
(32, 'Сидор', 'Сидоров', 'Сидорович', 1, 'Губино 2', 2, 12, '2024-03-10', ''),
(33, 'Петр', 'Петров', 'Петрович', 1, 'Ленина 4', 4, 13, '2024-03-13', ''),
(34, 'Кирилл', 'Крылов', 'Максимович', 1, 'Ленина 24', 5, 13, '2024-03-05', ''),
(35, 'Абрикос', 'Пятерочкович', 'Спаров', 1, 'Континентальная 23', 2, 12, '2024-03-26', ''),
(36, 'Антон', 'Чехов', 'Павлович', 1, 'Мичурина 2', 2, 13, '2024-10-05', 'Array');

-- --------------------------------------------------------

--
-- Структура таблицы `emp_disciplines`
--

CREATE TABLE `emp_disciplines` (
  `id` int(11) NOT NULL,
  `id_employees` int(11) NOT NULL,
  `disciplines_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `emp_disciplines`
--

INSERT INTO `emp_disciplines` (`id`, `id_employees`, `disciplines_id`) VALUES
(1, 21, 18),
(2, 22, 22),
(3, 30, 20),
(4, 31, 22),
(5, 32, 18),
(6, 33, 20),
(7, 34, 20),
(8, 35, 20),
(9, 36, 21);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `name`) VALUES
(2, 'Физрук'),
(3, 'Математик'),
(4, 'Биолог'),
(5, 'Географ');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`, `role_id`) VALUES
(9, 'Леха', 'admin', 'admin', 2),
(16, 'Антон', '123', '76d80224611fc919a5d54f0ff9fba446', 1),
(17, 'Илья', '1234', '76d80224611fc919a5d54f0ff9fba446', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `emp_disciplines`
--
ALTER TABLE `emp_disciplines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employees` (`id_employees`),
  ADD KEY `disciplines_id` (`disciplines_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `emp_disciplines`
--
ALTER TABLE `emp_disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_5` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `emp_disciplines`
--
ALTER TABLE `emp_disciplines`
  ADD CONSTRAINT `emp_disciplines_ibfk_1` FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `emp_disciplines_ibfk_2` FOREIGN KEY (`disciplines_id`) REFERENCES `disciplines` (`id`);

--
-- Ограничения внешнего ключа таблицы `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
