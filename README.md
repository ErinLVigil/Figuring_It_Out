# The Entrepreneur and the Analyst

## The Problem with Big Data![download](https://user-images.githubusercontent.com/109319148/211897811-4cbf956b-0829-454e-a0d8-6d1c067b32f0.png)


Data is everywhere. We have figured out how to capture data points from just about everything these days at a rate that is increasing in speed exponentially. To put 
some scale on this, Statista estimates that 1.134 trillion mb of data are created every single day. With so much data out there, our lives should be easier and we 
should be able to use this world-wide data lake and the powers of machine learning to prevent errors and minimize our mistakes in business. 

In theory, this sounds perfect! However, multitudes of data are being produced from so many different sources, it is nearly impossible for one person to collect, 
clean, and organize the data in time to make a decision before the data changes and predicts a different outcome. Data is being collected by a myriad of different 
organizations and stored in hard to find corners of the internet leaving much of that data completely unused.Something to consider, organizations typically only use 
25% of the data they collect from their own internal organization. 

Imagine if we wanted to prepare a complicated dish, but had to go to different cities and stores to get the ingredients. Once we had done that and dealt with varying 
currencies for each purchase, different units of measure, different package sizes, we would still have to learn and master complicated cooking techniques. All of this 
would be a daunting task for one person. This is the exact problem faced by any average entrepreneur looking to gather some data to help them use data to get any 
discernible edge over their competition.

###  The Solve for the Entrepreneur 

We don't have to travel to different cities these days to gather ingredients for a dish. Grocery store chains do an excellent job of sourcing quality ingredients and 
even selling us  already prepared meals ready to pop in the oven. What if there was a similar service for an entrepreneur, but in terms of data? What if someone wanted 
to start a particular business and was looking to see where to open that business and what sizes of business had track records of being successful? Doing the leg work 
to gather and aggregate this data and then run a machine learning model on it would require a team of specialized analysts making this almost impossible for the 
average business person working alone.

Our group is proposing a company that would have that team of analysts that would gather the necessary data sets from many sources, clean the data,(a huge task!!), 
run ML models on them to determine the most important factors for success and then provide an easy to use front-end dashboard that would allow the entrepenuer access 
to the results. The goal is to bring the benefits of the analysis to the average consumer and bridge that gap between analysts and those needing to use the 
information. Just like the grocery store, our company would use a team for specialization of labor and economies of scale in order to provide this service for a 
fraction of the cost that the average entrepreneur  would spend to hire a team and gather the data themselves.


## Proof of Concept

Gyms are a profitable business investment in the United States, more so than in Europe. In 2019, it is estimated that combined revenue totaled over $35 billion. Yet, 
the US is one of the statistically most "unhealthy" countries on the planet with high rates of obesity related diseases including diabetes and cardiovascular disease. 
Exercise is one component of combatting these trends. ![Gym_revenue](https://user-images.githubusercontent.com/109319148/211898094-078e6080-2b22-4624-9c48-
d241f1bb5351.png)


Opening a new gym, fitness center, or chain of gyms would be an appealing business to several types of entrepreneurs. It could be someone wanting a piece of that $35 
billion, or it could be an insurance company looking to reduce insurance claims on costly health care by preventing these conditions. Either way, our service could be 
useful!

### The Data

Gathering data is difficult. There are data sets on gym locations, but usually requires a purchase of that data or compiling it manually from hours of googling and 
cold calls to fill in holes in company size or revenue. We managed to find a decent data set for only a few dollars, but in practice would have our own team of 
analysts gather this information. We also gathered information by zip code on income levels and population. Ideally, this would need to also be expanded since the 
income data set was only about 75% complete and did not include data for any zipcode under 1000 people. We would also include data sets on number of people per 
household, education, sex, age range, professions, etc. This data is usually available on state websites, but would require aggregatting and formatting since none of 
the data is in similar formats.

Health data was harder to find. Again, this was a combination of data sets but would require more extensive research and aggregation from many data sources. We also 
were looking for information on activity levels and walkability by zipcode, however this data was too cumbersome to format in the time constraints and bandwidth of the 
POC.

#### Data base and Data cleaning

Cleaning the data in jupyter notebook for extra columns and null values revealed smaller data sets than we hoped for, but still enough to be usable. We then designed a 
data base in quickdbd to get an ERD. We built a logical diagram to decide how to join certain data sets. For example, the population data and the income data were in 
two different data sets. The population data had more zipcodes, so this would be a one to one relationship, but would need to be a right join to make sure to preserve 
as much of the population data as possible. ![QuickDBD-final](https://user-images.githubusercontent.com/109319148/211898207-df0e727a-d0a1-408b-9fe6-484518cafff4.png)


Once we had our finished schema, we were able to import this to pg Admin and use sql to combine the tables and do a bit more clean up. The information we were able to 
gather on cardiovascular disease trends and mortality rates were joined on the county name (locationdesc), but there were different counties in each data set requiring 
a full outer join to preserve as much information as possible here too. The gym data set that contained information on particular gyms was combined with the income and 
population data set on zipcode again, but this time we only wanted the information on the zip codes with gyms, so we did an inner join. ![pgadmin_db](https://user-
images.githubusercontent.com/109319148/211898236-574aadf0-4823-4aec-982e-139c3d0ca1b4.png)


Our training data set for the Machine Learning model was greated using the gym data set and the demographic information and exported to csv. The health data was also 
exported to be used in our visualizations.

### Machine Learning

Once the training file was read into jupyter notebook, preprocessing still needed to be done. We didn't have full income information for every zip code, so for the 
puroposes of this exercise, we had to fill in those values. To do this, we sorted the data by zip code and assumed that similar zip codes had similar information and 
filled down all null values from the closest value above it. We realize that there are errors and bias introduced, and in practice would fill in these values manually 
with our team of analysts.

The purpose of the model would be to predict if a gym was successful given a certain set of parameters. If a zipcode had a population of x, and income levels between y 
and z, would a gym of a certain size be "successful"? Our definition of "successful" in this case was a gym making over $500 k a year in revenue. This was data 
provided to us in our gym data set. We defined a column as "successful" and gave it a binary value (1) for successful and (0) for unsuccessful. Looking at our data, we 
had more than 50% of gyms that were unsuccessful. 

Many categorical columns are not going to be helpful to us such as the address of the gym. These were not factors that could determine the success of a gym. These 
columns were removed. Other categorical columns like Type were kept because they described the type of place as either urban, rural, etc. This could be useful. This 
column along with annual sales buckets and employee count buckets were processed using onehotencoder to break out these columns for the machine learning model. 

We chose a Support Vector Machine as our model because it could deal with linear and non linear data as well as produce a higher level of accuracy. The data was split, 
transformed and trained. After running the model, our accuracy prediction was a bit too high coming in at almost 0.97. We likely have some over fitting and would need 
to add more attributes to our model in order to get something more reasonably useful.

In practice, our ML model would be used to figure out what are the most important factors to the success of a particular industry and the type of data sets to include 
for analysis as we update the models annually. We could add data sets from social media, surrounding businesses, climate etc in order to make a reasonably accurate 
model to analyze.

### Visualization

We wanted to create a simple mock up for our entrepreneurs with a program that would create, easy-to-read, descriptive visualizations, so we used Tableau. ![dashboard]
(https://user-images.githubusercontent.com/109319148/211898839-8cc47092-fbff-4d49-952a-4927ceaa0d62.png)


We created a map that displays all of the gyms in the United Statesby zip code. Using an average count of "successful" gyms, we color coded the map. Zip codes that had 
a 50% success rate or higher are green and those with lower percentages of success are red. We also aded in a filter to look closer at a particular state. Other charts 
that could be interesting were included such as the distribution of income levels for the gyms. For the country, we can see that more than half are less than $500k, 
however, if a filter is applied, we can see the pie chart change to reflect a certain state or zip code. The same is true for size of gym measured by number of 
employees. For this POC for gyms, we also included another map that overlayed our health data to look at counties that have high levels of cadiovascular disease. This 
could be belpful to look at where a gym would do the most good for public health and would add value for our consumers. 

## Conclusion

Our proof of concept, while incredibly simplified for this purpose, was successful and we believe that some sort of platform could be created for this service given 
enough funding and hiring the right resources. Different business models can be created that would look at cost structure and employees that range from full-time, to 
freelance, to gig and would probably be geograpcially diverse utilizing data experts in many countries. 

The biggest barriers to success are finding usable data and using the powers of machine learning to figure out through trial and error what are the infuencing factors 
to each industry. We would need to run Proof of Concept on several industries to see if similar models can be used, or would we need industry niche specific models 
driving up our cost structure. 

Overall, our goal of bringing big data and the power of analytics to the average entrepreneur could be successful and help to de-mystify the world of data analytics by 
making usable and consumable data for the average consumer and hopefully a successful company launch for us at the same time!
