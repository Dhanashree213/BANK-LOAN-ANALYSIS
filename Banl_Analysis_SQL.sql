/* KPI_1 *
Year Wise Loan Amount Stats
*/

SELECT    year_no,
sum(concat((loan_amnt),'millions')) as total_loan_amount
from finance_1
group by year_no
order by year_no;

/* KPI_2 
Grade And Sub-Grade Wise revol_bal
*/

SELECT finance_1.grade,finance_1.sub_grade,SUM(finance_2.revol_bal) AS sum_revol_bal
FROM finance_1 
LEFT JOIN finance_2 
ON finance_1.id=finance_2.id
GROUP BY finance_1.grade,finance_1.sub_grade
ORDER BY finance_1.grade,finance_1.sub_grade;

/* KPI 3
Total Payment For Verified Status V/s Total Payment For Non-Verified Status
 */

select verification_status,sum(total_pymnt)
from finance_1  join finance_2
on finance_1.id=finance_2.id
group by 1
limit 2
;

/* KPI 4 
State Wise and Last_credit_pull_d Wise Loan Status
*/

Select finance_1.addr_state,finance_1.loan_status,count(finance_2.last_credit_pull_d)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by finance_1.addr_state,finance_1.loan_status
order by addr_state ;

/*KPI 5 
Home Ownership Vs Last PAYMENT Date Stats 
 */

select home_ownership,count(last_pymnt_d) count_last_pymnt_d
from finance_1 a join finance_2 as b 
on a.id=b.id 
group by home_ownership;

/*--------------------------------------------------------------------------------------------------------------------*/










