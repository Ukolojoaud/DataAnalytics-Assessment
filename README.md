# DataAnalytics-Assessment

I approached each question methodically, following a structured five-step process before concluding. Along the way, I encountered several challenges:
## Question 1:
One of my biggest challenges was identifying the correct column attributes. Specifically, when trying to derive the customer’s name, I found the name field in the users_customuser table empty. To resolve this, I merged the first_name and last_name fields to construct the full customer’s name.

## Question 2:
Creating a savings category was another hurdle. After attempting multiple approaches without success, I eventually found a solution by seeking assistance from Google, which helped me achieve the desired categorization.

## Question 3:
Column identification continued to be an issue. I struggled to locate the right column needed for certain queries, so I opted to use a relevant alternative—the description field in the savings_savingsaccount table. Additionally, I encountered difficulty identifying the correct attribute for the last transaction date column. Since the appropriate field wasn’t clear, I decided to use the available transaction_date field instead.

## Question 4:
While joining two tables, I initially ran into errors. My first attempt involved joining users_customuser.id with savings_savingsaccount.id, but this yielded no results. To fix this, I changed the join condition to owner_id, which successfully established the connection.
