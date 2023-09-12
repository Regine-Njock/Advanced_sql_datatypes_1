\c postgres
DROP DATABASE siteuser;

CREATE DATABASE siteuser;

\c siteuser

--Task 1
DROP TABLE IF EXISTS site_user;

CREATE TABLE site_user (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    uuid UUID,
    avatar BYTEA,
    role VARCHAR(20),
    birthday DATE,
    siblings TEXT[],
    availability TIME[][],
    site_settings JSONB,
    created_on TIMESTAMP,
    active_for interval day
);

-- INSERT INTO site_user (name, uuid, role, birthdate, siblings, availability, site_settings, created_on)
-- VALUES ('Miriam Valira', 'e41e1291-33b8-4316-8a86-28a618d5c338', 'Admin', '1995-08-29', ARRAY['Dani', 'Louis'], ARRAY[TIME '12:00:00', TIME '15:00:00'], '{"Background": "red", "notifications": False}', '2015-09-23 08:56:00'),
-- ('Johann Müller', 'd81331bf-a4f6-4ecd-8883-51dee509309e', 'User', '2002-05-09', ARRAY[]::text[], ARRAY[[TIME '09:00:00',TIME '14:00:00'], [TIME '18:00:00', TIME '20:00:00']], '{"notifications": True}', '2017-05-01 13:03:00'),
-- ('Louise Clark', 'e6168ec9-7306-44a5-9875-2c659e15740e', 'Moderator', '1992-05-03', ARRAY['Monique'], ARRAY[[TIME '09:00:00',TIME '12:00:00'], [TIME '13:00:00', TIME '17:00:00']], '{"notifications": True}', '2007-03-21 10:31:00');

--Task 2
INSERT INTO site_user (name, uuid, role, birthday, siblings, availability, site_settings, created_on)
VALUES 
    ('Miriam Valira', 'e41e1291-33b8-4316-8a86-28a618d5c338', 'Admin', '1995-08-29', '{"Dani", "Louis"}', '{{"12:00:00","15:00:00"}}', '{"background": "red", "notifications": false}', '2015-09-23 08:56:00'),
    ('Johann Müller', 'd81331bf-a4f6-4ecd-8883-51dee509309e', 'User', '2002-05-09', null, '{{"09:00:00","14:00:00"},{"18:00:00","20:00:00"}}', '{"notifications": true}', '2017-05-01 13:03:00'),
    ('Louise Clark', 'e6168ec9-7306-44a5-9875-2c659e15740e', 'Moderator', '1992-05-03', '{"Monique"}', '{{"09:00:00","12:00:00"},{"13:00:00","17:00:00"}}', '{"notifications": true}', '2007-03-21 10:31:00');

--SELECT name, uuid, role, birthday, siblings, availability, site_settings, created_on FROM site_user;


-- --Task 3
UPDATE site_user
SET active_for = CURRENT_TIMESTAMP - created_on;
-- -- --run on terminal
-- -- --SELECT name, active_for || ' days' AS active_for FROM site_user;

-- -- --Task 4

 --SELECT name, active_for from site_user;
SELECT name FROM site_user WHERE birthday < '2000-01-01';
-- SELECT name FROM site_user WHERE siblings IS NOT NULL;
-- SELECT name FROM site_user WHERE site_settings->>'notifications' = 'true';
-- SELECT name FROM site_user WHERE array_length(availability, 1) > 1;    -------(not working)