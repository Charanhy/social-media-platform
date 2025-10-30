-- Social Media Platform Database Setup Script
-- This script creates all necessary tables for the application

-- Make sure you're using the correct database
USE socialmedia;

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `likes`;
DROP TABLE IF EXISTS `friends`;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;

-- Create users table
CREATE TABLE `users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(255) NOT NULL UNIQUE,
  `Password` VARCHAR(255) NOT NULL,
  `CreatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  INDEX `idx_email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create posts table
CREATE TABLE `posts` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Content` TEXT NOT NULL,
  `User` INT NOT NULL,
  `DateTime` DATETIME NOT NULL,
  `CreatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`User`) REFERENCES `users`(`ID`) ON DELETE CASCADE,
  INDEX `idx_user` (`User`),
  INDEX `idx_datetime` (`DateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create comments table
CREATE TABLE `comments` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Content` TEXT NOT NULL,
  `Post` INT NOT NULL,
  `User` INT NOT NULL,
  `DateTime` DATETIME NOT NULL,
  `CreatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Post`) REFERENCES `posts`(`ID`) ON DELETE CASCADE,
  FOREIGN KEY (`User`) REFERENCES `users`(`ID`) ON DELETE CASCADE,
  INDEX `idx_post` (`Post`),
  INDEX `idx_user` (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create likes table
CREATE TABLE `likes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `User` INT NOT NULL,
  `Post` INT NOT NULL,
  `CreatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`User`) REFERENCES `users`(`ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Post`) REFERENCES `posts`(`ID`) ON DELETE CASCADE,
  UNIQUE KEY `unique_like` (`User`, `Post`),
  INDEX `idx_user` (`User`),
  INDEX `idx_post` (`Post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create friends table
CREATE TABLE `friends` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `User` INT NOT NULL,
  `Friend` INT NOT NULL,
  `CreatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`User`) REFERENCES `users`(`ID`) ON DELETE CASCADE,
  FOREIGN KEY (`Friend`) REFERENCES `users`(`ID`) ON DELETE CASCADE,
  UNIQUE KEY `unique_friendship` (`User`, `Friend`),
  INDEX `idx_user` (`User`),
  INDEX `idx_friend` (`Friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data with rich content

-- Sample users (15 users for a vibrant community)
INSERT INTO `users` (`FirstName`, `LastName`, `Email`, `Password`) VALUES
('Charan', 'Kumar', 'charan', 'pass@123'),
('John', 'Doe', 'john.doe@example.com', 'password123'),
('Jane', 'Smith', 'jane.smith@example.com', 'password123'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'password123'),
('Alice', 'Williams', 'alice.w@example.com', 'password123'),
('Michael', 'Brown', 'michael.b@example.com', 'password123'),
('Sarah', 'Davis', 'sarah.d@example.com', 'password123'),
('David', 'Miller', 'david.m@example.com', 'password123'),
('Emma', 'Wilson', 'emma.w@example.com', 'password123'),
('Chris', 'Moore', 'chris.m@example.com', 'password123'),
('Olivia', 'Taylor', 'olivia.t@example.com', 'password123'),
('James', 'Anderson', 'james.a@example.com', 'password123'),
('Sophia', 'Thomas', 'sophia.t@example.com', 'password123'),
('Daniel', 'Jackson', 'daniel.j@example.com', 'password123'),
('Ava', 'White', 'ava.w@example.com', 'password123');

-- Sample posts with engaging content
INSERT INTO `posts` (`Content`, `User`, `DateTime`) VALUES
-- Charan's posts (User 1)
('🎉 Just launched my new Social Media Platform project! Built with Java Swing and MySQL. Check it out on GitHub!', 1, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('💻 Coding session complete! Implemented friend management and post interactions. Feeling productive! #JavaDeveloper', 1, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('🌟 Thanks everyone for the amazing support! Our platform now has 15+ active users!', 1, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('🚀 Working on new features: image upload, dark mode, and real-time notifications. Stay tuned!', 1, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('📚 Learning new design patterns. MVC architecture is powerful for building scalable applications!', 1, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('☕ Good morning everyone! Ready to push some code today. What are you working on?', 1, NOW()),

-- John's posts (User 2)
('Hello everyone! This is my first post. Excited to be part of this community! 👋', 2, DATE_SUB(NOW(), INTERVAL 6 DAY)),
('Just finished reading "Clean Code" by Robert Martin. Highly recommended for developers! 📖', 2, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Beautiful sunset today! Sometimes you need to take a break from coding 🌅', 2, DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Jane's posts (User 3)
('Starting my journey in software development! Any tips for beginners? 💡', 3, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Completed my first Java project today! Feeling accomplished 🎊', 3, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('Looking for study buddies interested in algorithms and data structures 📊', 3, NOW()),

-- Bob's posts (User 4)
('Just deployed my first web application! The feeling is incredible! 🚀', 4, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Coffee + Code = Perfect combination ☕💻', 4, DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Alice's posts (User 5)
('Attended an amazing tech conference today! Learned so much about cloud computing ☁️', 5, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Who else loves debugging? It\'s like being a detective! 🔍', 5, NOW()),

-- Michael's posts (User 6)
('Started learning machine learning! The possibilities are endless 🤖', 6, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Built a chatbot using Python. AI is fascinating! 🧠', 6, DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Sarah's posts (User 7)
('UI/UX design is my passion! Good design makes great products 🎨', 7, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Just redesigned my portfolio website. Check it out! ✨', 7, DATE_SUB(NOW(), INTERVAL 2 DAY)),

-- David's posts (User 8)
('Cybersecurity is crucial in today\'s digital world! Stay safe online 🔐', 8, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Completed my ethical hacking certification! Ready for new challenges 🛡️', 8, NOW()),

-- Emma's posts (User 9)
('Mobile app development is so rewarding! Just published my first app 📱', 9, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('React Native vs Flutter - which one do you prefer? 🤔', 9, DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Chris's posts (User 10)
('Database optimization tips: Always index your queries! ⚡', 10, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('PostgreSQL vs MySQL - let\'s discuss! 💾', 10, DATE_SUB(NOW(), INTERVAL 2 DAY)),

-- Olivia's posts (User 11)
('Frontend development is my happy place! Love creating beautiful interfaces 🌈', 11, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('CSS Grid vs Flexbox - mastering both is the key! 📐', 11, NOW()),

-- James's posts (User 12)
('Backend architecture matters! Building scalable APIs with Spring Boot 🏗️', 12, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Microservices vs Monolithic - it depends on your use case! 🔧', 12, DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Sophia's posts (User 13)
('Data science is amazing! Just finished my first analysis project 📈', 13, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Python libraries: NumPy, Pandas, Matplotlib - the holy trinity! 🐍', 13, NOW()),

-- Daniel's posts (User 14)
('DevOps is transforming how we deploy applications! 🔄', 14, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Docker + Kubernetes = Perfect combo for containerization 🐳', 14, DATE_SUB(NOW(), INTERVAL 2 DAY)),

-- Ava's posts (User 15)
('Game development using Unity! Creating my first 3D game 🎮', 15, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Graphics programming is challenging but so rewarding! 🖼️', 15, DATE_SUB(NOW(), INTERVAL 1 DAY));

-- Extensive friendships (Charan has many friends)
INSERT INTO `friends` (`User`, `Friend`) VALUES
-- Charan's friends (mutual friendships)
(1, 2), (2, 1),   -- Charan and John
(1, 3), (3, 1),   -- Charan and Jane
(1, 4), (4, 1),   -- Charan and Bob
(1, 5), (5, 1),   -- Charan and Alice
(1, 6), (6, 1),   -- Charan and Michael
(1, 7), (7, 1),   -- Charan and Sarah
(1, 8), (8, 1),   -- Charan and David
(1, 9), (9, 1),   -- Charan and Emma
(1, 10), (10, 1), -- Charan and Chris
(1, 11), (11, 1), -- Charan and Olivia

-- Other friendships
(2, 3), (3, 2),   -- John and Jane
(2, 4), (4, 2),   -- John and Bob
(3, 5), (5, 3),   -- Jane and Alice
(4, 6), (6, 4),   -- Bob and Michael
(5, 7), (7, 5),   -- Alice and Sarah
(6, 8), (8, 6),   -- Michael and David
(7, 9), (9, 7),   -- Sarah and Emma
(8, 10), (10, 8), -- David and Chris
(9, 11), (11, 9), -- Emma and Olivia
(10, 12), (12, 10), -- Chris and James
(11, 13), (13, 11), -- Olivia and Sophia
(12, 14), (14, 12), -- James and Daniel
(13, 15), (15, 13); -- Sophia and Ava

-- Extensive likes (many people like Charan's posts)
INSERT INTO `likes` (`User`, `Post`) VALUES
-- Likes on Charan's posts
(2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),  -- Post 1
(2, 2), (3, 2), (5, 2), (7, 2), (9, 2), (11, 2),         -- Post 2
(2, 3), (4, 3), (6, 3), (8, 3), (10, 3), (12, 3),        -- Post 3
(3, 4), (5, 4), (7, 4), (9, 4), (11, 4),                 -- Post 4
(2, 5), (4, 5), (6, 5), (8, 5),                          -- Post 5
(2, 6), (3, 6), (4, 6), (5, 6), (6, 6), (7, 6),          -- Post 6

-- Charan likes others' posts
(1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12),
(1, 13), (1, 14), (1, 15), (1, 16), (1, 17),

-- Cross likes
(2, 10), (3, 7), (4, 8), (5, 11), (6, 13), (7, 15),
(8, 17), (9, 19), (10, 21), (11, 23), (12, 25),
(3, 9), (5, 12), (7, 14), (9, 16), (11, 18);

-- Extensive comments
INSERT INTO `comments` (`Content`, `Post`, `User`, `DateTime`) VALUES
-- Comments on Charan's posts
('This is awesome Charan! Great work! 👏', 1, 2, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Congratulations! Can\'t wait to try it out! 🎉', 1, 3, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Amazing project! The UI looks fantastic! 😍', 1, 5, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('You\'re an inspiration! Keep it up! 💪', 1, 7, DATE_SUB(NOW(), INTERVAL 4 DAY)),

('Great productivity! What\'s your secret? 😄', 2, 2, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Love your dedication! Keep coding! 💻', 2, 4, DATE_SUB(NOW(), INTERVAL 3 DAY)),

('Wow! 15 users already? That\'s impressive! 🚀', 3, 3, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Your platform is growing fast! Proud of you! 🌟', 3, 6, DATE_SUB(NOW(), INTERVAL 3 DAY)),

('Can\'t wait for the new features! 🎊', 4, 5, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('Dark mode would be amazing! 🌙', 4, 8, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('Image upload is much needed! 📸', 4, 9, DATE_SUB(NOW(), INTERVAL 1 DAY)),

('MVC is definitely powerful! Good choice! 👍', 5, 2, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Design patterns make code maintainable! 📚', 5, 10, DATE_SUB(NOW(), INTERVAL 1 DAY)),

('Good morning Charan! Working on a new project! ☀️', 6, 3, NOW()),
('Have a productive day! ✨', 6, 7, NOW()),

-- Comments on other posts
('Welcome to the community John! 👋', 7, 1, DATE_SUB(NOW(), INTERVAL 6 DAY)),
('Great to have you here! 😊', 7, 3, DATE_SUB(NOW(), INTERVAL 5 DAY)),

('Clean Code is a must-read! 📖', 8, 1, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('Added to my reading list! Thanks! 🙏', 8, 5, DATE_SUB(NOW(), INTERVAL 3 DAY)),

('Welcome Jane! Happy to help anytime! 💡', 10, 1, DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Start with basics and practice daily! 🎯', 10, 2, DATE_SUB(NOW(), INTERVAL 4 DAY)),

('Congratulations Jane! What was your project? 🎊', 11, 1, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('Well done! Keep building! 🚀', 11, 4, DATE_SUB(NOW(), INTERVAL 2 DAY)),

('Deployment feels amazing right? 😄', 13, 1, DATE_SUB(NOW(), INTERVAL 4 DAY)),
('Congrats on your first deployment! 🎉', 13, 3, DATE_SUB(NOW(), INTERVAL 3 DAY)),

('Best combination ever! ☕💻', 14, 1, DATE_SUB(NOW(), INTERVAL 1 DAY)),

('UI/UX is so important! Great passion! 🎨', 19, 1, DATE_SUB(NOW(), INTERVAL 5 DAY)),

('Security first! Great reminder! 🔐', 21, 1, DATE_SUB(NOW(), INTERVAL 3 DAY)),

('I prefer React Native! More flexible! 📱', 24, 1, DATE_SUB(NOW(), INTERVAL 1 DAY)),

('Indexing is crucial for performance! ⚡', 25, 1, DATE_SUB(NOW(), INTERVAL 5 DAY));

-- Display success message
SELECT 'Database setup completed successfully!' AS Status;

-- Show table structures
SHOW TABLES;