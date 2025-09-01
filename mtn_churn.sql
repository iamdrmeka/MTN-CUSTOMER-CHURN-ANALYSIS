/*select all data*/
SELECT *
FROM mtn_churn;

/*COUNTING ALL CUSTOMERS*/
SELECT COUNT(DISTINCT `customer ID`)
FROM mtn_churn;

/*counting all rows*/
SELECT count(*)
from mtn_churn;

/*check number of churn BY DISTINCT CUSTOMERS*/
SELECT COUNT(DISTINCT `customer id`)
FROM mtn_churn
WHERE `customer churn status` = 'yes';

/*AVERAGE AGE OF CUSTOMERS*/
SELECT AVG(AGE) as AVERAGE_AGE
FROM mtn_churn;


/*AVERAGE AGE OF CUSTOMERS WHO LEFT*/
SELECT AVG(AGE) as AVERAGE_AGE
FROM mtn_churn
WHERE `customer churn status` = 'yes';

/*SALES BY STATES*/

SELECT state, REGION, FORMAT(sum(`TOTAL REVENUE`), 2) AS REVENUE
FROM mtn_churn
group by state, REGION
ORDER BY sum(`total revenue`) desc;


/*STATE WITH HIGHEST NUMBER OF CUSTOMERS*/
select state, COUNT(DISTINCT `CUSTOMER ID`) AS customers
from mtn_churn
GROUP BY state
order by customers desc
limit 1; /*remove the limit to see number of customers for each state*/

/*STATES AND NUMBER OF CUSTOMERS*/
select state, COUNT(DISTINCT `CUSTOMER ID`) AS customers
from mtn_churn
GROUP BY state
order by customers desc;

/*states, Revenue and Customers*/
SELECT state, FORMAT(sum(`total revenue`), 2), 
count(DISTINCT `customer id`) as Customers
from mtn_churn
group BY State
order by sum(`total revenue`) DESC;

/*region with Highest churn*/
select region, count(distinct `customer id`)
FROM mtn_churn
where `customer churn status` = 'yes'
GROUP BY region

/*checking customer feedback and churn status*/
SELECT 
  REVIEW,
  CHURN
FROM (
  SELECT 
    `customer review` AS REVIEW,
    `Satisfaction Rate` AS RATING,
    COUNT(*) AS CHURN
  FROM mtn_churn
  WHERE `customer churn status` = 'yes'
  GROUP BY `customer review`, `Satisfaction Rate`
) AS SUB
ORDER BY RATING ASC;

/*device distribution*/
select `mtn device`, count(distinct `customer id`) as USERS
from mtn_churn
group by `mtn device`
ORDER BY USERS DESC;
/*most bought subscription plan*/

select  `subscription plan`,   count(`subscription plan`) AS VOLUME
from mtn_churn
group by `subscription plan`
order by VOLUME DESC;

SELECT `subscription plan`, sum(`number of times purchased`) as 'PURCHASE'
from mtn_churn
group by `subScription plan`
ORDER BY PURCHASE DESC;

/*REGIONAL REVENUE*/
SELECT region, FORMAT(sum(`total revenue`), 2) as REVENUE
FROM mtn_churn
group by region
order by revenue desc;