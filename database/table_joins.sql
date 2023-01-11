
select pop.population,
	pop.zipcode,
	inc.state_name,
	inc.type,
	inc.mean,
	inc.median,
	inc.stdev
into demographcics	
from population as pop
left join income as inc
on pop.zipcode = inc.zip_code;
	

select gyms.company_name,
	gyms.state,
	gyms.employee_count,
	gyms.annual_sales,
	gyms.zip1,
	dem.population,
	dem.type,
	dem.mean,
	dem.median,
	dem.stdev
into training_file_gyms
from gyms
inner join demographics as dem
on gyms.zip1=dem.zipcode;

select trends.locationdesc,
	trends.topic	as trends_topic,
	trends.data_value	as trends_data_value,
	trends.stratificationcategory1	as trends_cat1,
	trends.stratification1	as trends_cat1_value,
	trends.stratificationcategory2 as trends_cat2,
	trends.stratification2 as trends_cat2_value,
	trends.stratificationcategory3 as trends_cat3,
	trends.stratification3 as trends_cat3_value,
	mort.topic as mort_topic,
	mort.data_value 	as mort_data_value,
	mort.stratificationcategory1 as mort_cat1,
	mort.stratification1  as mort_cat1_value,
	mort.stratificationcategory2 as mort_cat2,
	mort.stratification2 as mort_cat2_value
into health
from trends
full outer join mortality as mort
on trends.locationdesc = mort.locationdesc;

select * from training_file_gyms
order by zipcode;	