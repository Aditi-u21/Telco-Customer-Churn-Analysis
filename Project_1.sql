CREATE DATABASE TelcoDB;
USE TelcoDB;
SELECT COUNT(*) FROM telco_cleaned;
SELECT * FROM telco_cleaned LIMIT 5;

SELECT Churn,COUNT(customerID) as count from telco_cleaned
group by Churn;

SELECT avg(tenure) as avg_tenure, Churn
from telco_cleaned
group by(Churn);

SELECT avg(MonthlyCharges) as avg_monthly_charges, Churn
from telco_cleaned
group by(Churn);

Select round(sum(TotalCharges),2) as revenue_lost 
from telco_cleaned
where Churn=1;


SELECT 'Offer A' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM telco_cleaned
WHERE `Offer_Offer A` = 'TRUE'

UNION ALL

SELECT 'Offer B' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END), COUNT(*),
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
FROM telco_cleaned
WHERE `Offer_Offer B` = 'TRUE'

UNION ALL

SELECT 'Offer C' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END), COUNT(*),
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
FROM telco_cleaned
WHERE `Offer_Offer C` = 'TRUE'

UNION ALL

SELECT 'Offer D' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END), COUNT(*),
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
FROM telco_cleaned
WHERE `Offer_Offer D` = 'TRUE'

UNION ALL

SELECT 'Offer E' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END), COUNT(*),
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
FROM telco_cleaned
WHERE `Offer_Offer E` = 'TRUE'
UNION ALL

SELECT 'No Offer' AS Offer,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END), COUNT(*),
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
FROM telco_cleaned
WHERE `Offer_Offer A` = 'FALSE'
  AND `Offer_Offer B` = 'FALSE'
  AND `Offer_Offer C` = 'FALSE'
  AND `Offer_Offer D` = 'FALSE'
  AND `Offer_Offer E` = 'FALSE';

SELECT 
  `Unlimited Data_Yes` AS data_plan,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM telco_cleaned
GROUP BY `Unlimited Data_Yes`;

SELECT
	`Satisfaction Score` AS Satisfaction_score,
    SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) as churned_customers,
    COUNT(*) as total_customers,
    ROUND(SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END)*100/COUNT(*),2) as Churn_rate
FROM telco_cleaned
GROUP BY `Satisfaction Score`;

SELECT 
	Churn,AVG(CLTV) as average_CLTV
FROM 
	telco_cleaned
GROUP BY
	Churn;
    
SELECT 
	CASE 
		WHEN Churn=1 THEN "Churned"
        WHEN Churn=0 THEN "Retained"
	END AS Customer_Status,
    AVG(`Number of Referrals`) as Average_referrals
FROM
	telco_cleaned
GROUP BY
	Churn;
    
SELECT 
  CASE WHEN Churn = 1 THEN 'CHURNED' ELSE 'RETAINED' END AS Churn_status,
  CASE WHEN gender = 0 THEN 'MALE' ELSE 'FEMALE' END AS Gender,
  COUNT(*) AS Total_Customers
FROM telco_cleaned
GROUP BY Churn, gender;

SELECT
	CASE WHEN Churn=1 THEN 'churned' ELSE 'Retained' END AS Churn_status,
    COUNT(*) as total_customers,
    ROUND(COUNT(*)*100/
    (SELECT COUNT(*) FROM telco_cleaned WHERE `OnlineSecurity_Yes`='TRUE'),2)
    AS churn_percentage
FROM telco_cleaned
WHERE `OnlineSecurity_Yes`='TRUE'
GROUP BY Churn,(`OnlineSecurity_Yes`);

SELECT
	CASE WHEN Churn=1 THEN 'churned' ELSE 'Retained' END AS Churn_status,
    COUNT(*) as total_customers,
    ROUND(COUNT(*)*100/
		 (SELECT COUNT(*) FROM telco_cleaned WHERE TotalCharges < 500),2)
         AS churn_percentage
FROM telco_cleaned
WHERE TotalCharges < 500
GROUP BY Churn;

SELECT
    ROUND(AVG(`Avg Monthly Long Distance Charges`),2) as average_ld_charge
FROM telco_cleaned
WHERE Churn=1;

SELECT 
  `Offer_Offer A`,
  `Offer_Offer B`,
  `Offer_Offer C`,
  `Offer_Offer D`,
  `Offer_Offer E`,
  `Contract_One year`,
  `Contract_Two year`,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS churn_rate
FROM telco_cleaned
GROUP BY 
  `Offer_Offer A`,
  `Offer_Offer B`,
  `Offer_Offer C`,
  `Offer_Offer D`,
  `Offer_Offer E`,
  `Contract_One year`,
  `Contract_Two year`
ORDER BY churn_rate DESC
LIMIT 5;

SELECT 
     COUNT(*) 
FROM telco_cleaned
WHERE Churn=1
AND `Premium Tech Support_Yes`='TRUE'
AND `TechSupport_Yes`='TRUE';

SELECT
  CASE 
    WHEN Age BETWEEN 18 AND 30 THEN '18–30'
    WHEN Age BETWEEN 31 AND 50 THEN '31–50'
    WHEN Age > 50 THEN '51+'
    ELSE 'Unknown'
  END AS Age_Group,
  SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
  COUNT(*) AS Total_Customers,
  ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage
FROM telco_cleaned
GROUP BY Age_Group
ORDER BY Age_Group;

