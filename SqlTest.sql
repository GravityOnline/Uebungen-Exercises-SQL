-- Some code as SQL placeholder because the repository is not showing properly as an sql repository..

-- Create a simple database for a blog platform

-- Create a table for users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for blog posts
CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create a table for comments on posts
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert some sample data into Users table
INSERT INTO Users (username, email, password_hash) VALUES
('alice', 'alice@example.com', 'hashed_password_123'),
('bob', 'bob@example.com', 'hashed_password_456');

-- Insert some sample data into Posts table
INSERT INTO Posts (user_id, title, content) VALUES
(1, 'My First Post', 'This is the content of my first post!'),
(2, 'Bob\'s Journey', 'This is the content of Bob\'s post.');

-- Insert some sample data into Comments table
INSERT INTO Comments (post_id, user_id, content) VALUES
(1, 2, 'Great post, Alice!'),
(2, 1, 'Very inspiring, Bob!');
