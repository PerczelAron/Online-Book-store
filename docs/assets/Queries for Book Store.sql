USE book_store;

-- ==== Select the top 5 best-selling books ==== -- 

SELECT	b.id AS Book_ID, 
		b.title AS Book_Title,
		sum(oi.order_quantity) AS Total_Orders
FROM books b INNER JOIN
	 order_items oi ON oi.book_id = b.id
GROUP BY Book_Title, Book_ID
ORDER BY Total_Orders DESC
LIMIT 5;


