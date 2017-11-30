-- 1 
SELECT fat_content 
FROM (
  SELECT DISTINCT fat_content 
  FROM product_dimension 
  WHERE department_description 
  IN ('Dairy') ) AS food 
  ORDER BY fat_content
  LIMIT 5;
  
  SELECT DISTINCT fat_content
  FROM product_dimension
  WHERE department_description
  IN ('Dairy')
  ORDER BY 1
  LIMIT 5;
-- top 5 de preductos lacteos con menos grasa
 -- 2 Explain this query

SELECT order_number, date_ordered
FROM store.store_orders_fact orders
WHERE orders.store_key IN (
  SELECT store_key
  FROM store.store_dimension
  WHERE store_state = 'MA') 
AND orders.vendor_key NOT IN (
    SELECT vendor_key
    FROM public.vendor_dimension
    WHERE vendor_state = 'MA')
AND date_ordered < '2003-03-01';

-- te da el numero de orden y fecha de las orden store de massachusetts de vendedores que no son de massachusetts


-- 3

SELECT customer_name, annual_income
FROM public.customer_dimension
WHERE (customer_gender, annual_income) IN
      (SELECT customer_gender, MAX(annual_income)
       FROM public.customer_dimension
       GROUP BY customer_gender);
       
       
-- 4 

 SELECT DISTINCT s.product_key, p.product_description
FROM store.store_sales_fact s, public.product_dimension p
WHERE s.product_key = p.product_key
    AND s.product_version = p.product_version
    AND s.store_key IN
      (SELECT store_key
       FROM store.store_dimension
       WHERE store_state = 'MA')
ORDER BY s.product_key;


-- 5


SELECT *
FROM store.store_orders_fact, public.vendor_dimension
WHERE date_ordered='2003-01-02'
AND store.store_orders_fact.vendor_key = public.vendor_dimension.vendor_key;

SELECT *
FROM store.store_orders_fact f
WHERE EXISTS (SELECT 1
				FROM vendor_dimension d
				WHERE d.vendor_key = f.vendor_key )
AND date_ordered = '2003-01-02';

-- 6


SELECT MAX(public.vendor_dimension.deal_size)
FROM store.store_orders_fact, public.vendor_dimension
WHERE date_ordered='2004-01-04';

SELECT MAX(public.vendor_dimension.deal_size)
FROM store.store_orders_fact f , public.vendor_dimension
WHERE EXISTS (SELECT 1
				FROM public.vendor_dimension d
				WHERE d.vendor_key = f.vendor_key)
AND date_ordered = '2004-01-04';
