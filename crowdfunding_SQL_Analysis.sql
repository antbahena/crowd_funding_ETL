-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT 
backers_count,
outcome,
cf_id
FROM campaign
WHERE (outcome = 'live')
ORDER by backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (cf_id), cf_id
FROM "Backers"
GROUP BY cf_id
ORDER BY COUNT(cf_id) DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT first_name, last_name, email, (goal - pledged) as remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts
ON (campaign.contact_id = contacts.contact_id)
WHERE (campaign.outcome = 'live')
ORDER BY Remaining_Goal_Amount DESC;



-- Check the table
SELECT * 
FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT 
Back.email,
Back.first_name,
Back.last_name,
camp.cf_id,
camp.company_name,
camp.description,
(camp.goal - camp.pledged) as left_of_goal
INTO email_backers_remaining_goal_amount
FROM campaign as camp
INNER JOIN "Backers" as Back
ON (camp.cf_id = Back.cf_id)
WHERE (camp.outcome = 'live')
ORDER BY Back.last_name;


-- Check the table
SELECT *
FROM email_backers_remaining_goal_amount

