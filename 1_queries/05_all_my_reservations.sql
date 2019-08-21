SELECT
  reservations.*,
  properties.*,
  AVG(property_reviews.rating) AS average_rating
FROM properties
  JOIN reservations ON properties.id = reservations.property_id
  JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1 AND reservations.end_date < now()::DATE
GROUP BY reservations.id, properties.id
ORDER BY reservations.start_date DESC LIMIT 10