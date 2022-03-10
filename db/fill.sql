-- Добавляем роли
INSERT INTO roles(name) VALUES 
('Guest'),
('Reader'),
('Author');

-- Добавляем пользователей
ALTER TABLE users DISABLE TRIGGER ALL;
INSERT INTO users(email, password_hash, first_name, last_name, avatar, role_id) VALUES
('ivanov@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Иван', 'Иванов', 'avatar-1.png', 2),
('petrov@example.com', '5f4dcc3b5aa765d61d8327deb882cf88', 'Пётр', 'Петров', 'avatar-2.png', 3);
ALTER TABLE users ENABLE TRIGGER ALL;

-- Добавляем категории
INSERT INTO categories(name) VALUES
('Деревья'),
('Жизнь'),
('Рамки'),
('Разное'),
('IT'),
('Музыка'),
('Кино'),
('Программирование'),
('Железо'),
('Мото'),
('Авто'),
('Водный спорт');

-- Добавляем публикации
ALTER TABLE articles DISABLE TRIGGER ALL;
INSERT INTO articles(title, announce, fullText, picture, user_id) VALUES
('Как собрать камни бесконечности', ' Вы можете достичь всего. Стоит только немного постараться и запастись книгами. Ёлки — это не просто красивое дерево. Это прочная древесина. Помните, небольшое количество ежедневных упражнений лучше, чем один раз, но много.', ' Первая большая ёлка была установлена только в 1938 году. Вы можете достичь всего. Стоит только немного постараться и запастись книгами. Бороться с прокрастинацией несложно. Просто действуйте. Маленькими шагами. Достичь успеха помогут ежедневные повторения. Рок-музыка всегда ассоциировалась с протестами. Так ли это на самом деле? Альбом стал настоящим открытием года. Мощные гитарные рифы и скоростные соло-партии не дадут заскучать. Помните, небольшое количество ежедневных упражнений лучше, чем один раз, но много. Программировать не настолько сложно, как об этом говорят. Освоить вёрстку несложно. Возьмите книгу новую книгу и закрепите все упражнения на практике. Это один из лучших рок-музыкантов. Как начать действовать? Для начала просто соберитесь. Ёлки — это не просто красивое дерево. Это прочная древесина. Этот смартфон — настоящая находка. Большой и яркий экран, мощнейший процессор — всё это в небольшом гаджете. Собрать камни бесконечности легко, если вы прирожденный герой.', 'forest', 2),
('Что такое золотое сечение', ' Процессор заслуживает особого внимания. Он обязательно понравится геймерам со стажем. Простые ежедневные упражнения помогут достичь успеха. Программировать не настолько сложно, как об этом говорят.', ' Бороться с прокрастинацией несложно. Просто действуйте. Маленькими шагами. Он написал больше 30 хитов. Из под его пера вышло 8 платиновых альбомов. Собрать камни бесконечности легко, если вы прирожденный герой. Помните, небольшое количество ежедневных упражнений лучше, чем один раз, но много. Простые ежедневные упражнения помогут достичь успеха. Как начать действовать? Для начала просто соберитесь. Программировать не настолько сложно, как об этом говорят. Игры и программирование разные вещи. Не стоит идти в программисты, если вам нравятся только игры. Этот смартфон — настоящая находка. Большой и яркий экран, мощнейший процессор — всё это в небольшом гаджете. Первая большая ёлка была установлена только в 1938 году. Достичь успеха помогут ежедневные повторения. Альбом стал настоящим открытием года. Мощные гитарные рифы и скоростные соло-партии не дадут заскучать. Освоить вёрстку несложно. Возьмите книгу новую книгу и закрепите все упражнения на практике.', 'sea', 2),
('Как достигнуть успеха не вставая с кресла', ' Достичь успеха помогут ежедневные повторения. Первая большая ёлка была установлена только в 1938 году. Вы можете достичь всего. Стоит только немного постараться и запастись книгами. Программировать не настолько сложно, как об этом говорят.', ' Игры и программирование разные вещи. Не стоит идти в программисты, если вам нравятся только игры. Процессор заслуживает особого внимания. Он обязательно понравится геймерам со стажем.', 'forest', 2);
ALTER TABLE articles ENABLE TRIGGER ALL;

-- Добавляем комментарии
ALTER TABLE comments DISABLE TRIGGER ALL;
INSERT INTO COMMENTS(user_id, article_id, text) VALUES
(2, 1, 'Плюсую, но слишком много буквы! Планируете записать видосик на эту тему? Совсем немного... Мне не нравится ваш стиль. Ощущение, что вы меня поучаете. Это где ж такие красоты? Согласен с автором! Давно не пользуюсь стационарными компьютерами. Ноутбуки победили.'),
(2, 1, 'Мне кажется или я уже читал это где-то? Хочу такую же футболку :-) Это где ж такие красоты? Совсем немного... Давно не пользуюсь стационарными компьютерами. Ноутбуки победили. Мне не нравится ваш стиль. Ощущение, что вы меня поучаете. Планируете записать видосик на эту тему?'),
(1, 2, 'Хочу такую же футболку :-) Совсем немного... Плюсую, но слишком много буквы!'),
(2, 2, 'Мне кажется или я уже читал это где-то? Давно не пользуюсь стационарными компьютерами. Ноутбуки победили. Это где ж такие красоты? Планируете записать видосик на эту тему? Совсем немного... Плюсую, но слишком много буквы!'),
(2, 2, 'Планируете записать видосик на эту тему?'),
(1, 2, 'Плюсую, но слишком много буквы! Хочу такую же футболку :-) Совсем немного... Это где ж такие красоты? Давно не пользуюсь стационарными компьютерами. Ноутбуки победили. Мне кажется или я уже читал это где-то? Согласен с автором!'),
(1, 3, 'Планируете записать видосик на эту тему? Согласен с автором! Хочу такую же футболку :-) Мне кажется или я уже читал это где-то? Это где ж такие красоты? Мне не нравится ваш стиль. Ощущение, что вы меня поучаете. Давно не пользуюсь стационарными компьютерами. Ноутбуки победили.'),
(2, 3, 'Плюсую, но слишком много буквы! Хочу такую же футболку :-) Совсем немного... Планируете записать видосик на эту тему?'),
(1, 3, 'Планируете записать видосик на эту тему? Согласен с автором!');
ALTER TABLE comments ENABLE TRIGGER ALL;

-- Добавляем связи между публикациями и категориями
ALTER TABLE articles_categories DISABLE TRIGGER ALL;
INSERT INTO articles_categories(article_id, category_id) VALUES
(1, 7),
(2, 12),
(3, 2);
ALTER TABLE articles_categories ENABLE TRIGGER ALL;