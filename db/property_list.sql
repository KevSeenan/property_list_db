DROP TABLE IF EXISTS property_list;

CREATE TABLE property_list (
  id SERIAL PRIMARY KEY,
  build_type VARCHAR (255),
  bedrooms INT,
  year_built INT,
  buy_let_status VARCHAR(255)
);
