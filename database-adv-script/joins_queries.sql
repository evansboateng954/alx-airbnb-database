-- Selecting users who made booking(s)
SELECT b.*, u.* FROM booking b INNER JOIN user u ON b.user_id = u.user_id ;


--selecting all properties and thier reviews 
-- get properties without review as well
SELECT p.*, r.* FROM property p LEFT JOIN review r ON p.property_id = r.property_id ORDER BY  name;


--select all elements from both user and booking table
SELECT u.*, b.* FROM user u FULL OUTER JOIN  booking b ON u.user_id = b.user_id;
