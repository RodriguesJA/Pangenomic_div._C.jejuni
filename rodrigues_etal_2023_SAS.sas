///******SAS Code used for Rodrigues et al., 2023 Microbial Genomics
some variables defined were used in previous analysis and not used below ****/////

title1 'Campy Clades';
libname results '[Directory]];

PROC IMPORT
DATAFILE="[Directory]"
OUT=WORK.campy
DBMS=XLS
REPLACE;
SHEET='FINAL all data';
run;
proc sort; by AccessionNum; 
run; 
PROC IMPORT
DATAFILE="[File]"
OUT=WORK.clades
DBMS=XLSX
REPLACE;
run;
proc sort; by AccessionNum; 
run; 
data combined; 
merge WORK.campy WORK.clades; 
 by AccessionNum;
run; 
proc print data=combined; 
  title ' Clades Data Combined';
run; 

proc contents data=combined;
run;
proc format;
value yesno 0='No' 1='Yes';
value SeasonOne 1="Fall" 2="Winter" 3="Spring" 4="Summer";
value SeasonTWO 0="All other seasons" 1="Spring";
value SeasonThree 0="All other seasons" 1="Summer"; 
value SeasonFour 0="Fall and Winter" 1="Spring and Summer";
value YearONE 1="2011" 2="2012" 3="2013" 4="2014";
value OutbreakOne 0="Not Outbreak" 1="Yes outbreak associated";
value IlnessDurationTwo 0="Less than average (9) days" 1=">= 9";
value AgegroupOne 1="0-9" 2="10-18" 3="19-64" 4=">65";
value SexOne 1="Female" 2="Male";
value RaceOne 1="Caucasian" 2="African American" 3="Asian" 4="Other";
value RaceTWO 1="Other" 0="Caucasian";
value EthnicityOne 0="Non-Hispanic/Latino" 1="Hispanic/Latino";
value EthnicityTwo 0="Non-Arab" 1="Arab";
value HospitalOne 1="Detriot Medical Center (DMC)" 2="Sparrow Health System" 3="Spectrum Health System" 4="University of Michigan (UM)" 5="MDHHS";
value CountyOne 1="Out of State Resident" 2="Clinton County" 3="Eaton County" 4="Ingham County" 5="Ionia" 6="Kent County" 7="Livingston County" 8="Macomb County" 9="Monroe County" 10="Newaygo County" 11="Oakland County" 12="Ottawa County" 13="Sagniaw County" 14="Washtenaw County" 15="Wayne County";
value CountyTWO 1="Other" 2="Clinton County" 3="Eaton County" 4="Ingham County" 5="Ionia" 6="Kent County" 7="Livingston County" 8="Macomb County" 9="Monroe County" 10="Newaygo County" 11="Oakland County" 12="Ottawa County" 13="Sagniaw County" 14="Washtenaw County" 15="Wayne County";
value ResidenceOne 1="Out of State Resident" 2="Rural Resident" 3="Urban Resident";
value ResidenceTwo 0="Rural Resident" 1="Urban Resident";
value CareTypeOne  0="Outpatient" 1="Inpatient";
value HospitalTWO 1="Patient Hospitalized" 0="Patient Not Hospitalized";
value HospitalDaysTwo 0="Below average" 1="> = average";
value Abdominal_painOne 1="Abdominal Pain Present" 0="No Abdominal Pain";
value Body_acheone 1="Body Ache Present" 0="No Body Ache";
value Diarrhea_one 1="Diarrhea Present" 0="No Diarrhea Present";
value Bloody_Stoolone 1="Blood in Stool" 0="No Blood in Stool";
value Chillsone 1="Chills present" 0="No chills Present";
value Fatigueone 1="Fatigue Present" 0="No Fatigue Present";
value Headacheone 1="Headache Present" 0="No Headache Present";
value Nauseaone 1="Nausea Present" 0="No Nausea Present";
value Vomitingone 1="Vomiting Present" 0="No Vomiting Present";
value Feverone 1="Fever Present" 0="No Fever Present";
value StooltypeOne 1="Solid Stool" 2="Watery Stool" 3="Loose Stool";
value Stooltypetwo 1="Stool is not solid" 0="Stool is Solid";
value WaterOne 1="Well Water" 2="Municipal" 3="Bottled" 4="Mixed Water Source";
value WaterTwo 1="Well Water" 0="All other sources";
value watering 1="Municipal and/or bottled water" 2="Any well water";
value Special_DietOne 1="Yes special diet consumption" 0="No special diet";
value Raw_EggsOne 1="Yes Raw Eggs Consumption" 0="No Raw Eggs";
value ChickenOne 0="No Chicken" 1="Yes Chicken";
value PoultryOne 0="No Poultry" 1="Yes Poultry";
value BeefOne 0="No Beef" 1="Yes Beef";
value PorkOne 0="No Pork" 1="Yes Pork";
value RedmeatOne 0="No Redmeat" 1="Yes Redmeat";
value RawFruitsOne 0="No Rawfruits" 1="Yes Rawfruits";
value TurkeyOne 0="No Turkey" 1="Yes Turkey";
value ChickenOne 0="No Chicken" 1="Yes Chicken";
value PoultryOne 0="No Poultry" 1="Yes Poultry";
value BeefOne 0="No Beef" 1="Yes Beef";
value PorkOne 0="No Pork" 1="Yes Pork";
value RedmeatOne 0= " No redmeat" 1="Yes redmeat";
value DelimeatOne 0="No delimeat" 1= "Yes delimeat";
value RawFruitsOne 0= "No RawFruit" 1="Yes RawFuit";
value LeafygreensOne 0="No LeafyGreens" 1="Yes LeafyGreens";
value RawveggiesOne 0="No raw veg" 1= "Yes raw veg"; 
value TravelOne 0="No Travel In past month" 1="Yes Travel";
value TravelTwo 0="No Travel IN US" 1="Yes IN US Travel";
value TravelThree 0="No Travel OUT US" 1="Yes OUT US Travel";
value TravelFour 0="ALL OTHER TRAVEL" 1="OUTSIDE US TRAVEL";
value abroad 0='No travel' 1='Travel in US' 2='Any international travel';
value Animal_contactone 0="No animalcontact" 1="Yes animalcontact";
value ReptilesOne 0="No Reptile" 1="Yes Reptile";
value LivestockOne 0="No Livestock" 1="Yes Livestock";
value Bird_PoultryOne 0="No Poultry Contact" 1="Yes Poultry";
value PetsOne 0="No Domestic Pets" 1="Yes Domestic Pets";
value PetsTwo 0="No other pets" 1="Yes other Pets";
value FoodConsumptionOne 1="Beef" 2="Chiciken" 3="Pork" 4="Raw_Eggs" 5="Raw_Fruits" 6="Raw_Veggie" 7="Turkey";
value tetversuscip 1='Tet,no CIP' 2='Any CIP';
value cipall 0='Susceptible' 1='All other abxR' 2='Any cipR';
value tetnocip 0='Susceptible' 1='All other abxR' 2='Tet_no cipR';
value tetvscipnomacro 0='Tet,no CIP' 1='CIP,CIPTET-no macro';
value all_clades  0 = 'clade IA' 1 = 'clade IB' 2 = 'clade IC' 3 = 'clade ID' 4 = 'clade IE' 5 = 'clade IF' 6 = 'clade 2' 7 = 'clade 3';
value clades_var  0 = 'clade 1' 1 = 'clade 2'  2 = 'clade 3';
value clades_varONE   1 = 'clade 1'  0 = 'all other clades';
value clades_varTWO   1 = 'clade 2'  0 = 'all other clades';
value clades_varTHREE 1 = 'clade 3'  0 = 'all other clades';
value clades_varONEA  1 = 'clade 1A' 0 = 'all other clades';
value clades_varONEB  1 = 'clade 1B' 0 = 'all other clades';
value clades_varONEC  1 = 'clade 1C' 0 = 'all other clades';
value clades_varONED  1 = 'clade 1D' 0 = 'all other clades';
value clades_varONEE  1 = 'clade 1E' 0 = 'all other clades';
value clades_varONEF  1 = 'clade 1F' 0 = 'all other clades';

/* Genetic Variables from MLST*/ 
value ccONE 1="CC ST-206" 0="All other CCs"; 
value ccTWO 1= "CC ST-21"  0="All other CCs";
value ccThree 1="CC ST-257" 0="All other CCs"; 
value ccFOUR 1="CC ST-45" 0="All other CCs"; 
value ccFIVE 1="CC ST-464" 0="All other CCs"; 
value ccSIX 1="CC ST-48" 0="All other CCs"; 
value ccSEVEN 1="CC ST-52" 0="All other CCs"; 
value ccEIGHT 1="CC ST-607" 0="All other CCs"; 
value ccNINE 1="CC ST-61" 0="All other CCs";
value ccTEN 1="CC ST-353" 0="All other CCs"; 

value stONE 1 = "ST 21"  0 = " All other STs"; 
value stTWO 1 = "ST 45"  0 = " All other STs";  
value stTHREE 1  = "ST 48" 0 = " All other STs"; 
value stFOUR 1 = "ST 50"  0 = " All other STs"; 
value stFIVE 1 = "ST 52"  0 = "All other STs"; 
value stSIX  1 = " ST 222"  0 = " All other STs";
value stSEVEN 1 = " ST 353" 0 = " All other STs"; 
value stEIGHT 1 = " ST 464" 0 = " All other STs"; 
value stNINE 1 =  " ST 922"  0 = " All other STs"; 
value stTEN 1 = " ST 929" 0 = " All other STs";
value stELEVEN 1 = "ST 982"  0 = "All other STs"; 

run;
data clades;
set work.combined;

if Clade = M then delete; /* dropping out non QC genome data*/

/*Aim1 Frontiers et al. dropped outstate cases 
if Residence_type='Outstate' then delete;*/

Season_var1=.M;
If Season="Fall" then Season_var1=1;
If Season="Winter" then Season_var1=2;
If Season="Spring" then Season_var1=3;
If Season="Summer" then Season_var1=4;

summerfall=.M; /*variable for logistic regression, used summer fall because those 2 % were similar compared to the winter/spring % Different geographic location could explain*/
If Season="Fall" then summerfall=1;
If Season="Winter" then summerfall=0;
If Season="Spring" then summerfall=0;
If Season="Summer" then summerfall=1;

/*Seasonality of Campylobacter spp. Olson et al (Chapter 9 Epid of Campylobacter jejuni infections in industrialized nations) has described spring and summer peaks
here Var2= Spring vs. all other and var3 is summer vs. all other seasons*/

season_var2=0;
If season_var1=.M then season_var2=.M;
If season_var1=3 then season_var2=1; 

season_var3=0;
If season_var1=.M then season_var3=.M;
If season_var1=4 then season_var3=1; 

season_var4=0;
If season_var1=.M then season_var4=.M;
If season_var1=3 then season_var4=1; 
If season_var1=4 then season_var4=1; 

Year_var=.M;
If Year="2011" then Year_var=1;
If Year="2012" then Year_var=2;
If Year="2013" then Year_var=3;
If Year="2014" then Year_var=4;

Outbreak_var=.M;
If Outbreak= "No" then Outbreak_var=0;
If Outbreak="Yes" then Outbreak_var=1;

IllnessDuration_var1=.M;
If Duration_illness=0 then IllnessDuration_var1=1;
If Duration_illness=3 then IllnessDuration_var1=2;
If Duration_illness=4 then IllnessDuration_var1=3;
If Duration_illness=5 then IllnessDuration_var1=4;
If Duration_illness=6 then IllnessDuration_var1=5;
If Duration_illness=7 then IllnessDuration_var1=6;
If Duration_illness=8 then IllnessDuration_var1=7;
If Duration_illness=9 then IllnessDuration_var1=8;
If Duration_illness=10 then IllnessDuration_var1=9;
If Duration_illness=11 then IllnessDuration_var1=10;
If Duration_illness=12 then IllnessDuration_var1=11;
If Duration_illness=13 then IllnessDuration_var1=12;
If Duration_illness=14 then IllnessDuration_var1=13;
If Duration_illness=15 then IllnessDuration_var1=14;
If Duration_illness=15 then IllnessDuration_var1=15;
If Duration_illness=18 then IllnessDuration_var1=16;
If Duration_illness=21 then IllnessDuration_var1=17;
If Duration_illness=23 then IllnessDuration_var1=18;

/* Long Duration (Mean/Median or greater vs. All Others*/
IllnessDuration_var2=0;
If IllnessDuration_var1=.M then IllnessDuration_var2=.M; 
If Duration_illness >=9 then IllnessDuration_var2=1; 

AgeGroup_var1=.M;
If Age_group="0-9" then AgeGroup_var1=1;
If Age_group="10-18" then AgeGroup_var1=2;
If Age_group="19-64" then AgeGroup_var1=3;
If Age_group=">65" then AgeGroup_var1=4;

Agegroup2_var=.M; /*Final variable used for table 1*/
If Age_group2="0-9" then Agegroup2_var =1; 
If Age_group2="10-18" then Agegroup2_var =2; 
If Age_group2="19-40" then Agegroup2_var =3; 
If Age_group2="41-65" then Agegroup2_var =4; 
If Age_group2=">65" then Agegroup2_var =5; 

/*SM Logisitic regression variables*/
age0_9=0;
	If Age_group2=" " then age0_9=.M; 
	If Age_group2="0-9" then age0_9=1; 
age41_65=0;
	If Age_group2=" " then age41_65=.M; 
	If Age_group2="41-65" then age41_65=1; 
age_65=0;
	If Age_group2=" " then age_65=.M; 
	If Age_group2=">65" then age_65=1; 
age10_18=0;
	If Age_group2=" " then age10_18=.M;
	If Age_group2="10-18" then age10_18=1;
age19_40=0;
	If Age_group2=" " then age19_40=.M;
	If Age_group2="19-40" then age19_40=1;

Sex_var=.M;
If Gender ="Female" then Sex_var=1;
If Gender ="Male" then Sex_var=2;

female=.M; /*SM variable for logistic regression*/
	If Gender ="Male" then female=0;
	if Gender ="Female" then female=1;

/*Included 3 biracial as "Other" (More Than 1)*/
Race_var1=.M;
If Race="Caucasian" then Race_var1=1;
If Race="African American" then Race_var1=2;
If Race="Asian" then Race_var1=3;
If Race="Other" then Race_var1=4;
If Race="More than 1" then Race_var1=4;

Race_var2=1;
If Race_var1=.M then Race_var2=.M; 
If Race_var1=1 then Race_var2=0;

otherrace=.M;/**SM logistic regression variable 'other race'***/
	If Race="Caucasian" then otherrace=0;
	If Race="African American" then otherrace=1;
	If Race="Asian" then otherrace=1;
	If Race="Other" then otherrace=1;
	If Race="More than 1" then otherrace=1;

Ethnicity_var1=.M;
If Hispanic_Ethnicity="Non-Hispanic/Latino" then Ethnicity_var1=0;
If Hispanic_Ethnicity="Hispanic/Latino" then Ethnicity_var1=1;

Ethnicity_var2=.M;
If Arab_Ethnicity="Non-Arab" then Ethnicity_var2=0;
If Arab_Ethnicity="Arab" then Ethnicity_var2=1;

Hospital_var=.M;
If Hospital="DMC" then Hospital_var=1;
If Hospital="Sparrow" then Hospital_var=2;
If Hospital="Spectrum" then Hospital_var=3;
If Hospital="UM" then Hospital_var=4;
If Hospital="MDHHS" then Hospital_var=5;

County_var1=.M;
If Residence_Type="Outstate" then County_var1=1;
If County="Clinton" then County_var1=2;
If County="Eaton" then County_var1=3;
If County="Ingham" then County_var1=4;
If County="Ionia" then County_var1=5;
If County="Kent" then County_var1=6;
If County="Livingston" then County_var1=7;
If County="Macomb" then County_var1=8;
If County="Monroe" then County_var1=9;
If County="Newaygo" then County_var1=10;
If County="Oakland" then County_var1=11;
If County="Ottawa" then County_var1=12;
If County="Saginaw" then County_var1=13;
If County="Washtenaw" then County_var1=14;
If County="Wayne" then County_var1=15;

/*county variable inlcuding "Other Counties" as described by Cha et al. includes out of state as Other county*/
county_var2=.M;
If county_var1=1 then County_var2=1;
If county_var1=2  then County_var2=2;
If county_var1=3  then County_var2=1;
If county_var1=4  then County_var2=4;
If county_var1=5  then County_var2=1;
If county_var1=6  then County_var2=1;
If county_var1=7  then County_var2=7;
If county_var1=8  then County_var2=8;
If county_var1=9  then County_var2=1;
If county_var1=10 then County_var2=1;
If county_var1=11  then County_var2=11;
If county_var1=12  then County_var2=1;
If county_var1=13 then County_var2=1;
If county_var1=14 then County_var2=14;
If county_var1=15  then County_var2=15;

county_var3= 0;
If County= "Wayne" then county_var3=1;
If county = .M then county_var3=.M; 

Residence_var1=.M; 
If Residence_Type="Outstate" then Residence_var1=1;
If Residence_Type="Rural" then Residence_var1=2;
If Residence_Type="Urban" then Residence_var1=3;

Residence_var2=.M;
If Residence_var1=2 then Residence_var2=0; /*rural out of state is marked missing*/
If Residence_var1=3 then Residence_var2=1; /*urban*/

urban=.M; /*SM logistic regression variable*/
If Residence_var1=2 then urban=0; /*rural*/
If Residence_var1=3 then urban=1; /*urban*/

/*Dummy Variable in order to exclude outof state cases in the univariate analyses*/
State_var=1; 
If Residence_var1=1 then state_var=0; 

CareType_var=.M;
If Care_Type="Hospitalized" then CareType_var=1;
If Care_Type="Outpatient" then CareType_var=0;
If Care_Type="Urgent Care" then CareType_var=0;
/*consider seperating caretypes includes Urgent Care*/

Hospital_Status_var=.M;
If Hospitalized="Yes" then Hospital_Status_var=1;
If Hospitalized="No" then Hospital_Status_var=0;

/*symptom score + disease severity*/
Abdominal_pain_var=.M; 
If Abdom_Pain="Yes" then Abdominal_Pain_var=1;
If Abdom_Pain="No" then Abdominal_Pain_var=0;

Body_Ache_var=.M;
If Body_Ache="Yes" then Body_Ache_var=1;
If Body_Ache="No" then Body_Ache_var=0;

Diarrhea_var=.M;
If Diarrhea="Yes" then Diarrhea_var=1;
If Diarrhea="No" then Diarrhea_var=0;

Bloody_Stool_var=.M;
If Bloody_stool="Yes" then Bloody_stool_var=1;
If Bloody_stool="No" then Bloody_stool_var=0;

Chills_var=.M;
If Chills="Yes" then Chills_var=1;
If Chills="No" then Chills_var=0;

Fatigue_var=.M;
If Fatigue="Yes" then Fatigue_var=1;
If Fatigue="No" then Fatigue_var=0;

Headache_var=.M;
If Headache="Yes" then Headache_var=1;
If Headache="No" then Headache_var=0;

Nausea_var=.M;
If Nausea="Yes" then Nausea_var=1;
If Nausea="No" then Nausea_var=0;

Vomiting_var=.M;
If Vomiting="Yes" then Vomiting_var=1;
If Vomiting="No" then Vomiting_var=0;

Fever_var=.M;
If Fever="Yes" then Fever_var=1;
If Fever="No" then Fever_var=0;

Stool_type_var1=.M;
If Stool_type= "Solid" then Stool_type_var1=1;
If Stool_type= "Watery" then Stool_type_var1=2;
If Stool_type= "Loose" then Stool_type_var1=3;
If Stool_type= "Watery/Loose" then Stool_type_var1=2;
If Stool_type= "Watery/loose" then Stool_type_var1=2;

Stool_type_var2=.M;
If Stool_type_var1=1 then Stool_type_var2=0;
If Stool_type_var1=2 then Stool_type_var2=1;
If Stool_type_var1=3 then Stool_type_var2=1;

/*water source variables*/
Water_var1=.M;
If Water_home="Well" then Water_var1=1;
If Water_home="Municipal" then Water_var1=2;
If Water_home="Bottled" then Water_var1=3; 
If Water_home="Municipal, Bottled" then Water_var1=4;
If Water_home="Well, Bottled" then Water_var1=4;

watertype=0; /*sm new variable comparing well to other water*/
	If Water_home=" " then watertype=.M;
	If Water_home="Bottled" then watertype=1; 
	If Water_home="Municipal, Bottled" then watertype=1;
	If Water_home="Municipal" then watertype=1;
	If Water_home="Well" then watertype=2;
	If Water_home="Well, Bottled" then watertype=2; 

wellwater=0;
	if watertype=.M then wellwater=.M;
	if watertype=2 then wellwater=1;

Water_var2=.M;
If Water_var1=1 then Water_var2=1;
If Water_var1=2 then Water_var2=0;
If Water_var1=3 then Water_var2=0;
If Water_var1=4 then Water_var2=0;
/*included mixed variables (Mucipal/Bottled and Well Bottled) in ALL OTHER SOURCES varibale*/

/*Consider Inlcuding multiple water variables for Mixed sources*/

/*Food Consumption*/
Food_consump_var=.M;
If Beef = "Yes" then Food_consump_var=1;
If Chicken = "Yes" then Food_consump_var=2;
If Pork = "Yes" then Food_consump_var=3; 
If Raw_eggs = "Yes" then Food_consump_var=4;
If Raw_fruits = "yes" then Food_consump_var=5;
If Rawveggie = "Yes" then Food_consump_var=6;
If Turkey ="Yes" then Food_consump_var=7;

Special_diet_var=.M;
If Special_diet ="No" then Special_diet_var=0;
If Special_diet ="Yes" then Special_diet_var=1;

RawEggs_var=.M;
If Raw_eggs ="No" then RawEggs_var=0;
If Raw_eggs ="Yes" then RawEggs_var=1;

Turkey_var=.M;
If Turkey ="No" then Turkey_var=0;
If Turkey ="Yes" then Turkey_var=1;

Chicken_var=.M;
If Chicken ="No" then Chicken_var=0;
If Chicken ="Yes" then Chicken_var=1;

Poultry_var=.M;
If Turkey_var=1 then Poultry_var=1;
If Chicken_var=1 then Poultry_var=1;
If Turkey_var=0 and Chicken_var=0 then Poultry_var=0;
If Turkey_var=.M and Chicken_var=0 then Poultry_var=0;
If Turkey_var=0 and Chicken_var=.M then Poultry_var=0; 
/* Includes missing variables for each turkey and chicken variables */

Beef_var=.M;
If Beef ="No" then Beef_var=0;
If Beef ="Yes" then Beef_var=1;

Pork_var=.M;
If Pork ="No" then Pork_var=0;
If Pork ="Yes" then Pork_var=1; 

Redmeat_var=.M;
If Beef_var=1 then Redmeat_var=1;
If Pork_var=1 then Redmeat_var=1;
If Beef_var=0 and Pork_var=0 then Redmeat_var=0;

Delimeat_var=.M;
If Deli_meat ="No" then Delimeat_var=0;
If Deli_meat ="Yes" then Delimeat_var=1;

RawFruits_var=.M;
If Raw_fruits ="No" then RawFruits_var=0;
If Raw_fruits ="Yes" then RawFruits_var=1;

Leafygreens_var=.M; 
If Leafy_greens ="No" then Leafygreens_var=0;
If Leafy_greens ="Yes" then Leafygreens_var=1; 

Rawveggies_var=.M;
If Raw_veggies = "No" then Rawveggies_var=0;
If Raw_veggies = "Yes" then Rawveggies_var=1;

/*Travel Variables*/
Travel_var1=.M;
If Travel_pastmonth = "No" then Travel_var1=0;
If Travel_pastmonth = "Yes" then Travel_var1=1;

Travel_var2=.M; /* inside the United States */
If travel_inUS = "No" then Travel_var2=0;
If travel_inUS = "Yes" then Travel_var2=1;

Travel_var3=.M; /*Outisde the United State */
If Travel_outUS = "No" then Travel_var3=0;
If Travel_outUS = "Yes" then Travel_var3=1;

traveltype=0; /*SM new variable- make relative to no travel*/
	if travel_inUS =. then traveltype=.M;
	if travel_outUS =. then traveltype=.M;
	If travel_inUS ='No' and travel_outUS = "No" then traveltype=0;
	If travel_inUS = "Yes" then traveltype=1; /*travel inside the US=domestic*/
	If travel_outUS = "Yes" then traveltype=2;  /*any travel outside the US=international*/
	If travel_inUS ='Yes' and travel_outUS = "Yes" then traveltype=2; /*both domestic and international travel= international*/
inttravel=0; /*variables for modeling*/
	if traveltype=.M then inttravel=.M;
	if traveltype=2 then inttravel=1;
domtravel=0; 
	if traveltype=.M then domtravel=.M;
	if traveltype=1 the domtravel=1;

/*Outside the US travel vs. all other travel (if both inlcuded in Outside US)*/
Travel_var4=.M; 
If Travel_var3=1 then Travel_var4=1; 
If Travel_var3=0 then Travel_var4=0;
If Travel_var2=1 and Travel_var3=1 then Travel_var4=1; 
If Travel_var2=0 and Travel_var3=1 then Travel_Var4=1;/* travel var 2 inside US travel */

/*for MH test across cateogry*/
Travel_var5=.M;
If Travel_var1=0 then travel_var5=.M;
If Travel_var3=1 then Travel_var5=1; 
If Travel_var3=0 then Travel_var5=0;
If Travel_var2=1 and Travel_var3=1 then Travel_var5=1; 
If Travel_var2=0 and Travel_var3=1 then Travel_var5=1;

/*Animal Contact Variables*/
Animalcontact_var=.M;
If animalcontact_pastweek = "No" then animalcontact_var=0;
If animalcontact_pastweek = "Yes" then animalcontact_var=1;

Reptiles_var=.M;
If Reptiles = "No" then Reptiles_var=0;
If Reptiles = "Yes" then Reptiles_var=1;

Livestock_var=.M;
If Livestock = "No" then Livestock_var=0;
If Livestock = "Yes" then Livestock_var=1;

Bird_Poultry_var=.M;
If Bird_Poultry = "No" then Bird_Poultry_var=0;
If Bird_Poultry = "Yes" then Bird_Poultry_var=1;

/* Domestic Pets */
Pets_var1=.M;
If Domestic_pets="No" then Pets_var1=0;
If Domestic_pets="Yes" then Pets_var1=1;

/*Other Pets*/
Pets_var2=.M;
If Other_animals ="No" then Pets_var2=0;
If Other_animals ="Yes" then Pets_var2=1;

/*Macrolide Resistance*/
Macrolide=.M;
If Sheet1_AZI=0 or Sheet1_ERY=0 then Macrolide=0;
If Sheet1_AZI=1 or Sheet1_ERY=1 then Macrolide=1;

/*Floroquinolone Resistance*/
Quinolone=.M;
If Sheet1_CIP=1 then Quinolone=1;
IF Sheet1_CIP=0 then Quinolone=0;

CIPTET=0; /*ciptet only, no mdr*/
	if abxprofile='CIPTET' then CIPTET=1;
tetonly=0;
	if abxprofile='TET' then tetonly=1;
ciponly=0;
	if abxprofile='CIP' then ciponly=1;
anycip=1; /*includes any isolates with cip*/
	if abxprofile='CIP' then anycip=2;
	if abxprofile='CIPTET' then anycip=2;
	if abxprofile='AZICIP' then anycip=2;
	if abxprofile='CIPTETCLI' then anycip=2;
	if abxprofile='CIPTETTEL' then anycip=2;
	if abxprofile='CIPAZIERYCLITEL' then anycip=2;
	if abxprofile='Susceptible' then anycip=0;
cipciptet_nomacro=.M; /*includes isolates with cipR and ciptetR but no macrolides vs all*/
	if abxprofile='Susceptible' then tetvscip=.M;
	if abxprofile='CIP' then cipciptet_nomacro=1;
	if abxprofile='CIPTET' then cipciptet_nomacro=1;
anycipvsall=0; /*any cip_with tet for analysis to compare to all other isolates*/
	if anycip=2 then anycipvsall=1;
tet_nocip=1; /*any tet without cip for analysis to compare to all other isolates*/
	if abxprofile='Susceptible' then tet_nocip=0;
	if abxprofile='TET' then tet_nocip=2;
	if abxprofile='GENTET' then tet_nocip=2;
onlytet_nocip=0; /*any tet without cip for analysis to compare to all other isolates*/
	if tet_nocip=2 then onlytet_nocip=1;
tetvscip=.M; /*any cip vs. tet_no cip vs. all others*/
	if abxprofile='Susceptible' then tetvscip=.M;
	if tet_nocip=2 then tetvscip=1;
	if anycipvsall=1 then tetvscip=2;
tetvscip_nomacro=.M; /*any tet vs cipR and ciptetR but no macrolides**/
	if abxprofile='Susceptible' then tetvscip_nomacro=.M;
	if tet_nocip=1 then tetvscip_nomacro=0;
	if cipciptet_nomacro=1 then tetvscip_nomacro=1;

/*genomic variables*/

all_clades = .M; 
if Clade = "IA"  then all_clades =0;
if Clade = "IB"  then all_clades =1; 
if Clade = "IC"  then all_clades =2; 
if Clade = "ID"  then all_clades =3; 
if Clade = "IE"  then all_clades =4; 
if Clade = "IF"  then all_clades =5; 
if Clade = "II"  then all_clades =6; 
if Clade = "III"  then all_clades =7; 

clades_var =.M; 
if Clade = "IA"  then clades_var =0;
if Clade = "IB"  then clades_var =0; 
if Clade = "IC"  then clades_var =0; 
if Clade = "ID"  then clades_var =0; 
if Clade = "IE"  then clades_var =0; 
if Clade = "IF"  then clades_var =0;
if Clade = "II"  then clades_var =1; 
if Clade = "III"  then clades_var =2; 

clades_var1 =.M; 
if Clade = "IA"  then clades_var1 =1;
if Clade = "IB"  then clades_var1 =1; 
if Clade = "IC"  then clades_var1 =1; 
if Clade = "ID"  then clades_var1 =1; 
if Clade = "IE"  then clades_var1 =1; 
if Clade = "IF"  then clades_var1 =1;
if Clade = "II"  then clades_var1 =0; 
if Clade = "III"  then clades_var1 =0; 

clades_var2 =.M; 
if Clade = "IA"  then clades_var2 =0;
if Clade = "IB"  then clades_var2 =0; 
if Clade = "IC"  then clades_var2 =0; 
if Clade = "ID"  then clades_var2 =0; 
if Clade = "IE"  then clades_var2 =0; 
if Clade = "IF"  then clades_var2 =0;
if Clade = "II"  then clades_var2 =1; 
if Clade = "III"  then clades_var2 =0; 

clades_var3 =.M;
if Clade = "IA"  then clades_var3 =0;
if Clade = "IB"  then clades_var3 =0; 
if Clade = "IC"  then clades_var3 =0; 
if Clade = "ID"  then clades_var3 =0; 
if Clade = "IE"  then clades_var3 =0; 
if Clade = "IF"  then clades_var3 =0;
if Clade = "II"  then clades_var3 =0; 
if Clade = "III"  then clades_var3 =1; 

clades_var1A =.M; 
if Clade = "IA"  then clades_var1A  =1;
if Clade = "IB"  then clades_var1A  =0; 
if Clade = "IC"  then clades_var1A  =0; 
if Clade = "ID"  then clades_var1A  =0; 
if Clade = "IE"  then clades_var1A  =0; 
if Clade = "IF"  then clades_var1A  =0;
if Clade = "II"  then clades_var1A  =0; 
if Clade = "III"  then clades_var1A =0; 

clades_var1B =.M; 
if Clade = "IA"  then clades_var1B =0;
if Clade = "IB"  then clades_var1B =1; 
if Clade = "IC"  then clades_var1B =0; 
if Clade = "ID"  then clades_var1B =0; 
if Clade = "IE"  then clades_var1B =0; 
if Clade = "IF"  then clades_var1B =0;
if Clade = "II"  then clades_var1B =0; 
if Clade = "III" then clades_var1B =0; 

clades_var1C =.M; 
if Clade = "IA"  then clades_var1C =0;
if Clade = "IB"  then clades_var1C =0; 
if Clade = "IC"  then clades_var1C =1; 
if Clade = "ID"  then clades_var1C =0; 
if Clade = "IE"  then clades_var1C =0; 
if Clade = "IF"  then clades_var1C =0;
if Clade = "II"  then clades_var1C =0; 
if Clade = "III" then clades_var1C =0;
 
clades_var1D =.M; 
if Clade = "IA"  then clades_var1D =0;
if Clade = "IB"  then clades_var1D =0; 
if Clade = "IC"  then clades_var1D =0; 
if Clade = "ID"  then clades_var1D =1; 
if Clade = "IE"  then clades_var1D =0; 
if Clade = "IF"  then clades_var1D =0;
if Clade = "II"  then clades_var1D =0; 
if Clade = "III" then clades_var1D =0; 

clades_var1E =.M;
if Clade = "IA"  then clades_var1E  =0;
if Clade = "IB"  then clades_var1E  =0; 
if Clade = "IC"  then clades_var1E  =0; 
if Clade = "ID"  then clades_var1E  =0; 
if Clade = "IE"  then clades_var1E  =1; 
if Clade = "IF"  then clades_var1E  =0;
if Clade = "II"  then clades_var1E  =0; 
if Clade = "III" then clades_var1E  =0;  

clades_var1F =.M;
if Clade = "IA"  then clades_var1F =0;
if Clade = "IB"  then clades_var1F =0; 
if Clade = "IC"  then clades_var1F =0; 
if Clade = "ID"  then clades_var1F =0; 
if Clade = "IE"  then clades_var1F =0; 
if Clade = "IF"  then clades_var1F =1;
if Clade = "II"  then clades_var1F =0; 
if Clade = "III" then clades_var1F =0;  

format inttravel domtravel age0_9 age10_18 age19_40 age41_65 age_65 summerfall female otherrace urban tetonly ciptet ciponly anycipvsall onlytet_nocip cipciptet_nomacro wellwater yesno. 
anycip cipall. tet_nocip tetnocip. tetvscip tetversuscip. tetvscip_nomacro tetvscipnomacro. Season_var1 SeasonOne. Season_var2 SeasonTwo. 
Season_var3 SeasonThree. Season_var4 SeasonFour. Year_var YearONE. Outbreak_Var OutbreakOne. IllnessDuration_var2 IlnessDurationTwo. 
Agegroup_var1 AgegroupOne. Sex_var SexOne. Race_var1 RaceOne. Race_var2 RaceTWO.  Ethnicity_var1 EthnicityOne.  Ethnicity_var2 EthnicityTwo. Hospital_var HospitalOne.  County_var1 CountyOne. County_var2 CountyTWO. 
Residence_var1 ResidenceOne. Residence_var2 ResidenceTwo. CareType_var CareTypeOne. Hospital_status_var HospitalTWO. Abdominal_pain_var Abdominal_painOne. 
Body_ache_var Body_acheone. Diarrhea_var Diarrhea_one. Bloody_stool_var Bloody_Stoolone. Chills_var Chillsone.  Fatigue_var Fatigueone. 
Headache_var Headacheone.  Nausea_var Nauseaone. Vomiting_var Vomitingone. Fever_var Feverone. Stool_Type_var1 StooltypeOne. Stool_type_var2 Stooltypetwo. 
Water_var1 WaterOne. watertype watering. Water_var2 WaterTwo. Special_Diet_var Special_DietOne.  RawEggs_var Raw_EggsOne. Turkey_var TurkeyOne. Chicken_var ChickenOne. 
Poultry_var PoultryOne. Beef_var BeefOne.  Pork_var PorkOne. Redmeat_var RedmeatOne. RawFruits_var RawFruitsOne. Delimeat_var DelimeatOne.  
Leafygreens_var Leafygreensone. Rawveggies_var Rawveggiesone. Travel_var1 TravelOne.  Travel_var2 TravelTwo. Travel_var3 TravelThree. 
Travel_var4 TravelFour. traveltype abroad. Animalcontact_var  Animal_contactone. Reptiles_var  ReptilesOne. Livestock_var LivestockOne. Bird_Poultry_var Bird_PoultryOne.
Pets_var1 PetsOne. Pets_var2 PetsTwo. food_consump_var foodconsumptionONE. all_clades all_clades. clades_var clades_var. clades_var1 clades_varONE. clades_var2 clades_varTWO. 
clades_var3 clades_varTHREE. clades_var1A clades_varONEA. clades_var1B clades_varONEB. clades_var1C clades_varONEC. clades_var1D clades_varONED. clades_var1E clades_varONEE. clades_var1F clades_varONEF.;
run;

/********
phylogeogrpahic temporal analysis i.e. year and county!*************/

proc freq data= clades;
title 'year vs clades';
table (all_clades clades_var clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)*(year)/chisq missprint; 
run; 

/* 2x2 table for county vs. clades */
proc freq data =  clades; 
title 'clades vs county'; 
table (clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)*(residence_type residence_var2 urban)/chisq missprint exact or; 
run; 

/**Outcomes: Identifying outcomes that are associated with different clades**/
proc freq data= clades; /*becuase only small ns within Clade1 subclades only assessed hospitalization**/ 
title "subclades by hospitalization"; 
tables (hospital_status_var)*(clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)/chisq missprint;
exact pchi or;
run; /*No association between subclades and hospitalization / outcome **/ 

proc freq data = clades; 
title 'clades by hospitalization'; 
tables (hospital_status_var)*(clades_var1 clades_var2 clades_var3)/chisq missprint;
exact pchi or; 

/* resistnace phenotypes vs. clade variables */
proc freq data =  clades; 
title 'clades vs resistance phenotypes'; 
table (clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)*(ciponly anycip tetonly sheet1_TET)/chisq missprint exact or; 
run; 

/**univariate analysis to asssess variables associated with clade2 and previously defined associations  -hospitalization**/ 
proc freq data =  clades; 
title 'clades by associated hospitalization variables';
tables (nausea_var fatigue_var otherrace inttravel domtravel female age_65 age41_65 )*(clades_var2)/chisq missprint; 
exact pchi or; 


proc logistic data= clades;  /*** Attempt at modeling for details associated with hospitalization****/
title "Predictors of hospitalization";
model hospital_status_var = summerfall age_65 age41_65 
female domtravel inttravel otherrace Fatigue_var Nausea_var clades_var2/ selection=forward details lackfit;
run;

/*********Travel vs genomic variables*****/
proc freq data = clades; 
proc freq data =  clades; 
title 'clades vs county'; 
table (clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)*(residence_var2 urban)/chisq missprint exact or; 
run; 
proc freq data =  clades; 
title "clades";
table (clade ST CC Host);
run;


/*Michigan Specific Isolates*/
proc freq data =  clades;
title "Genomic varible Michigan Specific";
where traveltype = 0;
table (clade ST CC Host);
run;
/* Travel associated isoalte*/ 
proc freq data =  clades; 
title "Genomic varibles vs. Travel"; 
where traveltype ^= 0; 
table (clade ST CC Host); 
run; 
proc freq data =  clades; 
title "Genomic variables total"; 
tables (clade ST CC Host)*(traveltype);
run;
 

/**Residence and genomic variables*/
proc freq data =  clades; 
title "clades";
table (Clade ST CC Host)*(residence_var2);
run;
proc sort; by AccessionNum; 
run; 
proc print; 
var residence_var2 AccessionNum;
run;
proc freq data= clades;
table (inttravel domtravel);
run; 

/*Identifying risk factors for the different clades and sub-clades*/
proc freq data=clades;
title "risk factors for clades and sub-clades";
tables (year season_var1 season_var2 season_var3 season_var4 sex_var race_var1 race_var2 ethnicity_var1 ethnicity_var2 hospital_var residence_var2 special_diet_var RawEggs_var Turkey_var Chicken_var Poultry_var Beef_var Pork_var Delimeat_var Redmeat_var Rawfruits_var Leafygreens_var Rawveggies_var animalcontact_var reptiles_var livestock_Var bird_poultry_var pets_var1 pets_var2 travel_var1 travel_var2 travel_var3 travel_var4 water_var1 water_var2)*(clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)/chisq missprint;
exact pchi or;
run;
proc freq data=clades; 
title "age and travel variables vs. clades and sub-clades";
tables (age0_9 age10_18 age19_40 age41_65 age_65 traveltype inttravel domtravel)*(clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F);
exact pchi or; 
run;
proc freq data=clades; 
title "cattle density and hospitalization vs. clades and sub-clades";
tables (cowdensitygrp hospital_status_var)*(clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F);
exact pchi or; 
run; 

/**Outcomes associated with infection. Identifying outcomes that are associated with different clades and sub-clades**/
proc freq data=resist;
title "resistance by symptoms"; where state_var=1;
tables (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2 )*(clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D clades_var1E clades_var1F)/chisq missprint;
exact pchi or;
run;