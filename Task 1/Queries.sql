-- Exploratory Data Analysis On Super Store Sales dataset
--- Creating a table to load dataset in Postgress SQL
CREATE TABLE SuperStore(
	Ship_Mode TEXT,
	Segment TEXT,
	Country TEXT,
	City TEXT,
	State TEXT,
	Postal_code TEXT,
	Region TEXT,
	Category TEXT,
	Sub_Category TEXT,
	Sales NUMERIC,
	Quantity INTEGER,
	Discount NUMERIC,
	Profit NUMERIC
);

