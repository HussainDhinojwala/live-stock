INSERT INTO Customer(LastName, FirstName, Address, City, State, ZipCode, Telephone, Email, Rating)
VALUES ('Yang', 'Shang', '123 Success Street', 'Stony Brook', 'NY', '11790', '5166328959', 'syang@cs.sunysb.edu', 1);

INSERT INTO Customer(LastName, FirstName, Address, City, State, ZipCode, Telephone, Email, Rating)
VALUES ('Du', 'Victor', '456 Fortune Road', 'Stony Brook', 'NY', '11790', '5166324360', 'vicdu@cs.sunysb.edu', 1);

INSERT INTO Customer(LastName, FirstName, Address, City, State, ZipCode, Telephone, Email, Rating)
VALUES ('Smith', 'John', '789 Peace Blvd.', 'Los Angeles', 'CA', '93536', '3154434321', 'jsmith@ic.sunysb.edu', 1);

INSERT INTO Customer(LastName, FirstName, Address, City, State, ZipCode, Telephone, Email, Rating)
VALUES ('Philip', 'Lewis', '135 Knowledge Lane', 'Stony Brook', 'NY', '11794', '5166668888', 'pml@cs.sunysb.edu', 1);

INSERT INTO Account_(AccCreDate, CreditCNum, CusId)
VALUES ('2006-10-01 00:00:00', '1234567812345678', 4);

INSERT INTO Account_(AccCreDate, CreditCNum, CusId)
VALUES ('2006-10-15 00:00:00', '5678123456781234', 2);

INSERT INTO Stock (StockSymbol, StockName, StockType, SharePrice, NumAvailShares)
VALUES ('GM', 'General Motors', 'automotive', 34.23, 1000);

INSERT INTO Stock (StockSymbol, StockName, StockType, SharePrice, NumAvailShares)
VALUES ('IBM', 'IBM', 'computer', 91.43, 500);

INSERT INTO Stock (StockSymbol, StockName, StockType, SharePrice, NumAvailShares)
VALUES ('F', 'Ford', 'automotive', 9.0, 750);

INSERT INTO Portfolio (AccNum, StockSymbol, NumShares, Stop_, StopPrice)
VALUES (1, 'GM', 250, 'None', NULL);

INSERT INTO Portfolio (AccNum, StockSymbol, NumShares, Stop_, StopPrice)
VALUES (1, 'F', 100, 'None', NULL);

INSERT INTO Portfolio (AccNum, StockSymbol, NumShares, Stop_, StopPrice)
VALUES (2, 'IBM', 50, 'None', NULL);

INSERT INTO Employee (SSN, LastName, FirstName, Address, City, State, ZipCode, Telephone, StartDate, HourlyRate, Position_)
VALUES ('123456789', 'Smith', 'David', '123 College Road', 'Stony Brook', 'NY', '11790', '5162152345', '2005-11-01 00:00:00', 60, 'CusRep');

INSERT INTO Employee (SSN, LastName, FirstName, Address, City, State, ZipCode, Telephone, StartDate, HourlyRate, Position_)
VALUES ('789123456', 'Warren', 'David', '456 Sunken Street', 'Stony Brook', 'NY', '11794', '6316329987', '2006-02-02 00:00:00', 50, 'Manager');

INSERT INTO Order_ (StockSymbol, OrderType, NumShares, CusAccNum, Timestamp_, PriceType, StopPrice, EmpId, Recorded)
VALUES ('F', 'Sell', 30, 1, NOW(), 'Market', NULL, 1, 0);

SET SQL_SAFE_UPDATES = 0;
UPDATE Order_ O
	SET Recorded = 1
	WHERE O.OrderId = 10;
SET SQL_SAFE_UPDATES = 1;

INSERT INTO Order_ (StockSymbol, OrderType, NumShares, CusAccNum, Timestamp_, PriceType, StopPrice, EmpId, Recorded)
VALUES ('IBM', 'Sell', 155, 2, NOW(), 'Trailing Stop', 90, 1, 0);

SET SQL_SAFE_UPDATES = 0;
UPDATE Stock SET SharePrice = 100
	WHERE StockSymbol = 'IBM';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE Stock SET SharePrice = 95
	WHERE StockSymbol = 'IBM';
SET SQL_SAFE_UPDATES = 1;

DROP VIEW Suggest;
DROP TRIGGER NumSharesValid;
DROP TRIGGER DoTransact;
DROP TRIGGER UpdatePortfolio;

DROP TABLE StockPriceHistory;
DROP TABLE ConditionalPriceHistory;
DROP TABLE Transact;
DROP TABLE Order_;
DROP TABLE Portfolio;
DROP TABLE Account_;
DROP TABLE Stock;
DROP TABLE Customer;
DROP TABLE Employee;