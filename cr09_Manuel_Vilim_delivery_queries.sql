/*Basic Nr4*/
SELECT * FROM `employee` WHERE `forwarding_time` BETWEEN "2020-03-26 11:12:13" AND "2020-03-26 13:14:15"



SELECT customer_ID, first_name FROM CUSTOMER WHERE first_name = 'Walter'

SELECT product_ID, type_of_sending, weight_in_g FROM product WHERE weight_in_g > 55

SELECT customer_ID, first_name, last_name,credit_card_info FROM CUSTOMER WHERE credit_card_info = 'Visa100558945'

SELECT first_name, type_of_sending FROM `customer` INNER JOIN `product` on fk_customer_ID = customer_ID

SELECT storage_ID, type FROM `storage` LEFT JOIN `transport` on fk_storage_ID = storage_ID


/*Bonus 2*/
SELECT * FROM `payment` INNER JOIN `customer` on fk_customer_ID = customer_ID INNER JOIN `employee` on fk_employee_ID = employee_ID