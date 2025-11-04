-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

SELECT users.name, bookings.name
FROM bookings
INNER JOIN users
on booking.user_id = users.id;

-- a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT properties.name, reviews.comments, reviews.created_at
FROM properties
LEFT JOIN reviews
on properties.id = reviews.properties_id
ORDER BY reviews.created_at DESC;

-- a query using a FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user.

SELECT users.name, bookings.name
FROM users
FULL OUTER JOIN bookings
on users.id = booking.user_id;
