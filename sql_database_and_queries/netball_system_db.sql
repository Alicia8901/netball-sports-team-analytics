CREATE DATABASE if not exists netball_system_db;
USE netball_system_db;

CREATE TABLE players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fixtures (
    fixture_id INT AUTO_INCREMENT PRIMARY KEY,
    opponent VARCHAR(100) NOT NULL,
    fixture_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    fixture_id INT NOT NULL,
    availability_status VARCHAR(20) DEFAULT 'Available',
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
        ON DELETE CASCADE,
    FOREIGN KEY (fixture_id) REFERENCES fixtures(fixture_id)
        ON DELETE CASCADE
);

INSERT INTO players (full_name, position, email)
VALUES
('Aisha Khan', 'Goal Shooter', 'aisha.khan@example.com'),
('Emily Carter', 'Goal Attack', 'emily.carter@example.com'),
('Sophie Brown', 'Wing Attack', 'sophie.brown@example.com'),
('Mia Thompson', 'Centre', 'mia.thompson@example.com'),
('Lily Johnson', 'Wing Defence', 'lily.johnson@example.com'),
('Chloe Williams', 'Goal Defence', 'chloe.williams@example.com'),
('Hannah Davis', 'Goal Keeper', 'hannah.davis@example.com'),
('Olivia Smith', 'Wing Attack', 'olivia.smith@example.com'),
('Grace Wilson', 'Centre', 'grace.wilson@example.com'),
('Zara Ali', 'Goal Shooter', 'zara.ali@example.com');

INSERT INTO fixtures (opponent, fixture_date, location)
VALUES
('London Lions', '2026-06-10', 'London Arena'),
('Manchester Storm', '2026-06-15', 'Manchester Sports Hall'),
('Birmingham Blaze', '2026-06-20', 'Birmingham Indoor Centre'),
('Leeds Lightning', '2026-06-25', 'Leeds Sports Complex');

INSERT INTO registrations (player_id, fixture_id, availability_status)
VALUES
(1, 1, 'Available'),
(2, 1, 'Available'),
(3, 1, 'Unavailable'),
(4, 2, 'Available'),
(5, 2, 'Available'),
(6, 2, 'Unavailable'),
(7, 3, 'Available'),
(8, 3, 'Available'),
(9, 3, 'Available'),
(10, 4, 'Unavailable'),
(1, 4, 'Available'),
(5, 4, 'Available');










