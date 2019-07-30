DROP TABLE IF EXISTS Property;

CREATE TABLE Property(
  id SERIAL PRIMARY KEY,
  build_type VARCHAR (255),
  bedrooms INT,
  year_built INT,
  buy_let_status BOOLEAN
);
