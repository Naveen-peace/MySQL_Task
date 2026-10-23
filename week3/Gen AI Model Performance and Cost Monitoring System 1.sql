create database GenAI_DB;
use GenAI_DB;
#1
create table AI_Models(model_ID int,model_name varchar(100),model_type varchar(50),provider varchar(50),CostPer_1K_Tokens decimal(10,2),release_date date);
#2
create table API_Usage (Usage_ID int,Model_ID int,application_name varchar(100),input_tokens int,output_tokens int,usage_date date,Response_Time_Seconds decimal(8,2));
#Create both tables using appropriate data types and constraints. Set primary keys and establish a foreign key between the tables. 
alter table AI_Models modify model_ID int primary key;
alter table API_Usage add foreign key(Model_ID) references AI_Models(model_ID);
#Insert at least 6 AI model records and 10 API usage records. Include at least one model with no API usage and at least one API usage record with a NULL response time. 
insert into AI_Models (Model_ID, Model_Name, Model_Type, Provider,CostPer_1K_Tokens, Release_Date) values
(1, 'GPT-4o', 'Multimodal', 'OpenAI', 0.50, '2024-05-13'),
(2, 'Claude 3.5 Sonnet', 'Language Model', 'Anthropic', 0.60, '2024-06-20'),
(3, 'Gemini 1.5 Pro', 'Multimodal', 'Google', 1.25, '2024-02-15'),
(4, 'Llama 3.1', 'Open Source LLM', 'Meta', 0.20, '2024-07-23'),
(5, 'DALL-E 3', 'Image Generation', 'OpenAI', 0.80, '2023-10-01'),
(6, 'Whisper', 'Speech Recognition', 'OpenAI', 0.15, '2022-09-21');

insert into API_Usage (Usage_ID, Model_ID, Application_Name, Input_Tokens,Output_Tokens, Usage_Date, Response_Time_Seconds) values
(101, 1, 'Chatbot App', 1200, 800, '2026-10-01', 1.25),
(102, 2, 'Customer Support', 2000, 1000, '2026-10-02', 2.40),
(103, 3, 'Content Generator', 1500, 900, '2026-10-03', 1.80),
(104, 4, 'Research Assistant', 3000, 1800, '2026-10-04', 3.50),
(105, 6, 'Code Assistant', 2500, 1200, '2026-10-05', 2.10),
(106, 1, 'Document Summarizer', 1800, 700, '2026-10-06', NULL),
(107, 2, 'Education App', 1000, 600, '2026-10-07', 1.60),
(108, 3, 'Email Assistant', 800, 500, '2026-10-08', 0.95),
(109, 1, 'Image Creator', 500, 300, '2026-10-09', 4.20),
(110, 4, 'Developer Tool', 2200, 1100, '2026-10-10', 2.75);

create table third_API (Model_ID int,model_name varchar(100),status varchar(15));
insert into third_API values(1,'GPT-4o','Active'),
(7,'Gemini 3.0 Pro','inActive'),(8,'Whisper','Active');

# Display all AI models and their API usage details using an INNER JOIN. 
select a.Model_ID,
b.usage_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.application_name,b.Input_Tokens,b.Output_Tokens,b.Response_Time_Seconds from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID;

# Display all AI models, including models that have never been used, using a LEFT JOIN
select a.Model_ID,
b.usage_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.application_name,b.Input_Tokens,b.Output_Tokens,b.Response_Time_Seconds from AI_Models a left join API_Usage b on a.Model_ID = b.Model_ID;

#Display all API usage records, including records whose model details are unavailable, using a RIGHT JOIN. Explain how such records are affected by the foreign key constraint. 
select a.Model_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.model_name,b.status from AI_Models a right join third_API b on a.Model_ID = b.Model_ID;

select a.Model_ID,
b.usage_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.application_name,b.Input_Tokens,b.Output_Tokens,b.Response_Time_Seconds from AI_Models a right join API_Usage b on a.Model_ID = b.Model_ID;

# Display all models and all API usage records, including unmatched rows, using a MySQL-compatible alternative to FULL OUTER JOIN. 
select a.Model_ID,
b.usage_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.application_name,b.Input_Tokens,b.Output_Tokens,b.Response_Time_Seconds from AI_Models a left join API_Usage b on a.Model_ID = b.Model_ID
union
select a.Model_ID,
b.usage_ID,
a.Model_Name,a.Model_Type,a.Provider,a.CostPer_1K_Tokens,a.Release_Date,
b.application_name,b.Input_Tokens,b.Output_Tokens,b.Response_Time_Seconds from AI_Models a right join API_Usage b on a.Model_ID = b.Model_ID;

# Calculate the estimated API cost for each usage record using the formula: Estimated Cost = (Input_Tokens + Output_Tokens) / 1000 × Cost_Per_1K_Tokens 
select a.Model_Name,b.Usage_ID,round(b.Input_Tokens + b.output_tokens)/1000 * a.CostPer_1K_Tokens as Estimated_Cost from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID ;
select a.Model_Name,b.Usage_ID,(b.Input_Tokens + b.output_tokens)/1000 * a.CostPer_1K_Tokens as Estimated_Cost from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID ;
select a.Model_Name,b.Usage_ID,sum(b.Input_Tokens + b.output_tokens)/1000 * a.CostPer_1K_Tokens as Estimated_Cost from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID group by a.Model_Name,b.Usage_ID,a.CostPer_1K_Tokens having Estimated_Cost <1.0 ;

#8. Use a CASE statement to classify API response time: ● Less than or equal to 2 seconds: Fast ● Greater than 2 and less than or equal to 5 seconds: Moderate ● Greater than 5 seconds: Slow ● Missing response time: Not Available 
select
    Usage_ID,
    Response_Time_Seconds,
    CASE
        WHEN Response_Time_Seconds > 5  THEN 'slow'
        WHEN Response_Time_Seconds <= 2 THEN 'Fast'
        WHEN Response_Time_Seconds between 2 and 5 THEN 'Moderate'
        else 'Not Available'
   end as Response_Category
from API_Usage;
#Display the total number of API calls and total estimated cost for each model using aggregate functions and GROUP BY. 
select a.Model_Name,b.Usage_ID,count(b.Usage_ID) as Total_API_Calls,sum(b.Input_Tokens + b.output_tokens)/1000 * a.CostPer_1K_Tokens as Estimated_Cost 
from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID group by a.Model_Name,b.Usage_ID,a.CostPer_1K_Tokens ;

#Display only models whose total estimated API cost exceeds ₹100 using HAVING. Use appropriate sample data so that the condition can be tested. 
select a.Model_Name,b.Usage_ID,sum(b.Input_Tokens + b.output_tokens)/1000 * a.CostPer_1K_Tokens as Estimated_Cost 
from AI_Models a inner join API_Usage b on a.Model_ID = b.Model_ID group by a.Model_Name,b.Usage_ID,a.CostPer_1K_Tokens having Estimated_Cost >=1.0 ;

#Display model names in uppercase and extract the year of release using string and date functions. 
select model_id,upper(Model_Name) as name,extract( year from Release_Date) as year_of_release from AI_Models;

#Display API usage records from the current month using date functions.
select * from API_Usage where month(usage_date) = month(curdate()); 

select*from AI_Models;
select*from API_Usage;
select*from third_API;