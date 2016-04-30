
-- Produce a summary listing of revenue generated by a particular stock, stock type, or customer

CREATE VIEW STOCKREVENUE (StockSymbol, TotalRevenue) AS
	SELECT O.StockSymbol, SUM(T.TransFee)
	FROM Order_ O, Transact T
	WHERE O.Recorded = 1 AND O.OrderId = T.OrderId
	GROUP BY O.StockSymbol;

CREATE VIEW STOCKTYPEREVENUE (StockType, TotalRevenue) AS
	SELECT S.StockType, SUM(T.TransFee)
	FROM Stock S, Transact T, Order_ O
	WHERE O.StockSymbol = S.StockSymbol AND O.Recorded = 1
	AND O.OrderID=T.OrderId
	GROUP BY S.StockType;

CREATE VIEW CUSTOMERREVENUE(CusAccNum, TotalRevenue) AS
	SELECT O.CusAccNum, SUM(T.TransFee) AS TotalRevenue 
	FROM Order_ O, Transact T 
	WHERE O.Recorded = 1 AND O.OrderID = T.OrderId 
	GROUP BY O.CusAccNum;

-- Determine which customer representative generated most total revenue

CREATE VIEW EMPLOYEEREVENUE(EmpId, TotalRevenue) AS
SELECT O.EmpId, SUM(T.TransFee) AS TotalRevenue
FROM ORDER_ O, Transact T
WHERE O.OrderID=T.OrderId AND O.Recorded = 1 AND O.EmpID <> 0
GROUP BY O.EmpId;

-- Produce a list of most actively traded stocks

CREATE VIEW MostTraded(StockSymbol, StockName, NumOrders) AS
SELECT O.StockSymbol, S.StockName, COUNT(*) AS NumOrders
FROM Order_ O, Stock S
WHERE O.StockSymbol = S.StockSymbol
GROUP BY O.StockSymbol;

-- Produce a list of stock suggestions for a given customer (based on that customer's past orders)

CREATE FUNCTION suggestHelper() RETURNS int(11)
  RETURN @cusacc;

CREATE VIEW Suggest(StockSymbol, SharePrice, NumAvailShares, StockType) AS
SELECT S.StockSymbol, S.SharePrice, S.NumAvailShares, S.StockType
FROM Stock S, Order_ O
WHERE (O.CusAccNum = suggestHelper() AND O.StockSymbol = S.StockSymbol);


-- Example to run
-- SET @cusacc = 1;
-- SELECT * FROM Suggest;

-- Best-Seller list of stocks generated based on what stocks have been sold the most.

CREATE VIEW BestSellers(StockSymbol, TotalShares) AS
SELECT O.StockSymbol, SUM(O.NumShares) AS TotalShares
FROM Order_ O
GROUP BY O.StockSymbol;

-- Best-Seller list of stocks generated based on what stocks have been sold the most, with all Stock info
CREATE VIEW BestSellers2(StockSymbol, StockName, StockType, SharePrice, NumAvailShares, TotalShares) AS
SELECT S.StockSymbol, S.StockName, S.StockType, S.SharePrice, S.NumAvailShares, SUM(O.NumShares) AS TotalShares
FROM Order_ O, Stock S
WHERE O.StockSymbol = S.StockSymbol
GROUP BY O.StockSymbol;
