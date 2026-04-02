use bank_loan;

select * from indian_financial_loan;

## Summary

select count(id) as total_loan_application from indian_financial_loan;

SELECT COUNT(id) AS MTD_total_loan_application 
FROM indian_financial_loan
WHERE MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;
  
select sum(loan_amount) as total_loan_amount from indian_financial_loan;

select sum(loan_amount) as mtd_total_loan_amount from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select sum(loan_amount) as pmtd_total_loan_amount from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select sum(total_payment) from indian_financial_loan;

select sum(total_payment) as mtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select sum(total_payment) as pmtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select round(avg(int_rate),4)*100 as avg_int_rate from indian_financial_loan;

select round(avg(int_rate),4)*100 as mtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select round(avg(int_rate),4)*100 as pmtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select round(avg(dti),4)*100 as avg_debt_income from indian_financial_loan;

select round(avg(dti)*100,2) as mtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

select round(avg(dti),4)*100 as pmtd_total_payment from indian_financial_loan 
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 11 
AND YEAR(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 2021;

#good loan
select round((count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)/
count(id),2) as good_loan_percentage from indian_financial_loan;

select count(id) as good_loan_application from indian_financial_loan
where loan_status = 'Fully Paid' or 'Current';

select sum(loan_amount) as good_loan_amount_funded from indian_financial_loan
where loan_status = 'Fully Paid' or 'Current';

select sum(total_payment) as good_loan_amount_received from indian_financial_loan
where loan_status = 'Fully Paid' or 'Current';

#bad loan
select round((count(case when loan_status = 'Charged Off' then id end)*100)/
count(id),2) as bad_loan_percentage from indian_financial_loan;

select count(id) as bad_loan_application from indian_financial_loan
where loan_status = 'Charged Off';

select sum(loan_amount) as bad_loan_amount_funded from indian_financial_loan
where loan_status = 'Charged Off';

select sum(total_payment) as bad_loan_amount_received from indian_financial_loan
where loan_status = 'Charged Off';

select loan_status from indian_financial_loan;

select loan_status,
count(id) as LoanCount,
sum(total_payment) as Total_Amount_Received,
sum(loan_amount) as Total_Funded_Amount,
round(avg(int_rate * 100),2) as Interest_Rate,
round(avg(dti * 100),2) as DTI
 from indian_financial_loan
 group by loan_status;
 
select loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount) as MTD_Total_Funded_Amount
from indian_financial_loan
where month(STR_TO_DATE(issue_date, '%d-%m-%Y')) = 12 
group by loan_status;

## Overview

SELECT
	month(STR_TO_DATE(issue_date, '%d-%m-%Y')) as Months,
    MONTHNAME(STR_TO_DATE(issue_date, '%d-%m-%Y')) AS Month_Name,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
GROUP BY MONTHNAME(STR_TO_DATE(issue_date, '%d-%m-%Y')),
         MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y'))
ORDER BY MONTH(STR_TO_DATE(issue_date, '%d-%m-%Y'));

SELECT
	address_state,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
GROUP BY address_state;

SELECT
	term,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
GROUP BY term
order by term;

SELECT
	emp_length as Employee_Length,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
group by emp_length
order by emp_length;

SELECT
	purpose,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
GROUP BY purpose
order by count(id) desc;

SELECT
	home_ownership,
    COUNT(id) AS Total_Loan_Application,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM indian_financial_loan
where grade = 'A'
GROUP BY home_ownership
order by count(id) desc;

## Details
select * from indian_financial_loan
order by id ;
