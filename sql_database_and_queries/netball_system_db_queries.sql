-- Fixture Engagement Analysis
SELECT f.opponent,f.fixture_date,COUNT(r.registration_id) AS total_players_registered
FROM fixtures AS f
LEFT JOIN registrations AS r 
ON f.fixture_id = r.fixture_id
GROUP BY f.fixture_id, f.opponent, f.fixture_date
ORDER BY f.fixture_date;

-- Player Position Distribution
SELECT position,COUNT(player_id) AS total_players
FROM players
GROUP BY position
ORDER BY total_players DESC;

-- Players Participation Overview
SELECT p.full_name,COUNT(r.registration_id) AS total_registrations
FROM players AS p
LEFT JOIN registrations AS r
ON p.player_id = r.player_id
GROUP BY p.full_name
ORDER BY total_registrations DESC;

-- Player Availability Breakdown
SELECT availability_status,COUNT(*) AS total_players
FROM registrations
GROUP BY availability_status;

-- Full Dataset
SELECT p.full_name,p.position,f.opponent,f.fixture_date,r.availability_status,r.registered_at
FROM registrations r
JOIN players p ON r.player_id = p.player_id
JOIN fixtures f ON r.fixture_id = f.fixture_id;

-- Players Table
SELECT player_id,full_name,position,email FROM players;

-- Fixtures Table
SELECT fixture_id,opponent, fixture_date, location FROM fixtures;

-- Registrations Table
SELECT registration_id,player_id, fixture_id, availability_status FROM registrations;

-- Total Players
SELECT COUNT(*) AS total_players
FROM players;

-- Total Registrations
SELECT COUNT(*) AS total_registrations
FROM registrations;

-- Total Fixtures
SELECT COUNT(*) AS total_fixtures
FROM fixtures;
