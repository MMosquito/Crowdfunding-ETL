-- Challenge Bonus queries.
-- 1. (2 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM backers
ORDER BY cf_id DESC



-- 2. (2 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (cf_id)
FROM backers 



-- 3. (4 pts)
-- Create a table, "email_contacts_remaining_goal_amount", that has the first and last name, and email address of each contact.
-- And, the amount left to reach the goal for all "live" projects in descending order. 
CREATE TABLE "email_contacts_remaining_goal_amount" AS
	SELECT first_name, last_name, email, goal
	FROM backers, campaign
	ORDER BY goal DESC;



-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount



-- 4. (7 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE "email_backers_remaining_goal_amount" AS
	SELECT backers.email, backers.first_name, backers.last_name,
	campaign.company_name, campaign.description, 
	campaign.end_date, campaign.goal
	FROM backers
	INNER JOIN campaign on backers.cf_id=campaign.cf_id;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

