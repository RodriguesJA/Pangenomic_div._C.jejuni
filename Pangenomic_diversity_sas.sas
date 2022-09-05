title1 'Campy Clades';
libname results 'C:\Users\mannin71\Dropbox\Jose Rodrigues\Pangenomic diversity paper_Microbial Genomics';

PROC IMPORT /*importing in the epi data file*/
DATAFILE="C:\Users\mannin71\Dropbox\Jose Rodrigues\Pangenomic diversity paper_Microbial Genomics/Campy_ALLDATA_2020_0706_updated_SM"
OUT=WORK.campy
DBMS=XLS
REPLACE;
SHEET='FINAL all data';
run;
proc sort; by AccessionNum; 
run; 
proc print data=WORK.campy; 
  title 'epi data';
run; 
proc contents data=WORK.campy;
run;

PROC IMPORT /*importing in the genomics data file*/
DATAFILE="C:\Users\mannin71\Dropbox\Jose Rodrigues\Pangenomic diversity paper_Microbial Genomics/genomic_information_sas"
OUT=WORK.clades
DBMS=XLSX
REPLACE;
SHEET='genomics';
run;
proc sort; by AccessionNum; 
run; 
proc print data=WORK.clades; 
  title 'genomics data';
run; 
proc contents data=WORK.clades;
run;

PROC IMPORT /*importing in the ARGs data file*/
DATAFILE="C:\Users\mannin71\Dropbox\Jose Rodrigues\Pangenomic diversity paper_Microbial Genomics/resistance genes"
OUT=WORK.args
DBMS=XLSX
REPLACE;
SHEET='args';
run;
proc sort; by AccessionNum; 
run; 
proc print data=WORK.args; 
  title 'args data';
run; 
proc contents data=WORK.args;
run;

data combined; /*merge the epi and genomics data files*/
merge WORK.campy WORK.clades WORK.args; 
 by AccessionNum;
run; 
proc print data=combined; 
  title 'Clades Data Combined';
  var AccessionNum clade st cc blaOXA_61 blaOXA_184 blaOXA_193 blaOXA_447 blaOXA_449 blaOXA_460	blaOXA_461 
blaOXA_465 blaOXA_466 aph3_III tet_O tet_O_32_O gyrA_T86I rpsL_K43R;
run; 
proc contents data=combined;
run;

proc format; /*formatting variables*/
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
value tetall 0='Susceptible' 2='All other abxR' 1='Any tetR';
value tetnocip 0='Susceptible' 1='All other abxR' 2='Tet_no cipR';
value tetvscipnomacro 0='Tet,no CIP' 1='CIP,CIPTET-no macro';
value all_clades  0 = 'clade IA' 1 = 'clade IB' 2 = 'clade IC' 3 = 'clade ID' 4 = 'clade IE' 5 = 'clade IF' 6 = 'clade 2' 7 = 'clade 3';
value clades_var  0 = 'clade 1' 1 = 'clade 2'  2 = 'clade 3';
value clade1A_F  1 = 'clade 1'  0 = 'all other clades';
value epitable 0='other subclades' 1='ID' 2='IF' 3='Clade 2' 4='Clade 3';
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

/*Different groupings*/
age0_18=0;
	If Age_group2=" " then age0_18=.M; 
	If Age_group2="0-9" then age0_18=1; 
	If Age_group2="10-18" then age0_18=1; 
age_19=0;
	If Age_group2=" " then age_19=.M; 
	If Age_group2="19-40" then age_19=1; 
	If Age_group2="41-65" then age_19=1; 
	If Age_group2=">65" then age_19=1;
age_41=0;
	If Age_group2=" " then age_41=.M; 
	If Age_group2="41-65" then age_41=1; 
	If Age_group2=">65" then age_41=1;

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

rural=.M; /*SM logistic regression variable*/
If Residence_var1=2 then rural=1; /*rural*/
If Residence_var1=3 then rural=0; /*urban*/

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

densecows=.M; /*cow density for modeling*/
If cowdensitygrp='low<8400' then densecows=0;
If cowdensitygrp='high>=8400' then densecows=1;

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
anytet=1; /*includes any isolates with cip*/
	if abxprofile='CIP' then anytet=2;
	if abxprofile='AZI' then anytet=2;
	if abxprofile='AZICIP' then anytet=2;
	if abxprofile='AZICLI' then anytet=2;
	if abxprofile='CIPAZIERYCLITEL' then anytet=2;
	if abxprofile='FFN' then anytet=2;
	if abxprofile='Susceptible' then anytet=0;
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

clade1=.M; /*clades 2 and 3*/
	if all_clades=0 then clade1=1;
	if all_clades=1 then clade1=1;
	if all_clades=2 then clade1=1;
	if all_clades=3 then clade1=1;
	if all_clades=4 then clade1=1;
	if all_clades=5 then clade1=1;
	if all_clades=6 then clade1=0;
	if all_clades=7 then clade1=0;

subclade_df=0; /*for Table 3 epi associations*/
	if all_clades=3 then subclade_df=1; /*subclade ID*/
	if all_clades=5 then subclade_df=2; /*subclade IF*/
	if all_clades=6 then subclade_df=3; /*clade II*/
	if all_clades=7 then subclade_df=4; /*clade III*/	

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


format inttravel domtravel age0_9 age41_65 age_65 summerfall female otherrace urban tetonly ciptet ciponly anycipvsall onlytet_nocip cipciptet_nomacro wellwater yesno. 
anycip cipall. anytet tetall. tet_nocip tetnocip. tetvscip tetversuscip. tetvscip_nomacro tetvscipnomacro. Season_var1 SeasonOne. Season_var2 SeasonTwo. 
Season_var3 SeasonThree. Season_var4 SeasonFour. Year_var YearONE. Outbreak_Var OutbreakOne. IllnessDuration_var2 IlnessDurationTwo. 
Agegroup_var1 AgegroupOne. Sex_var SexOne. Race_var1 RaceOne. Race_var2 RaceTWO.  Ethnicity_var1 EthnicityOne.  Ethnicity_var2 EthnicityTwo. Hospital_var HospitalOne.  County_var1 CountyOne. County_var2 CountyTWO. 
Residence_var1 ResidenceOne. Residence_var2 ResidenceTwo. CareType_var CareTypeOne. Hospital_status_var HospitalTWO. Abdominal_pain_var Abdominal_painOne. 
Body_ache_var Body_acheone. Diarrhea_var Diarrhea_one. Bloody_stool_var Bloody_Stoolone. Chills_var Chillsone.  Fatigue_var Fatigueone. 
Headache_var Headacheone.  Nausea_var Nauseaone. Vomiting_var Vomitingone. Fever_var Feverone. Stool_Type_var1 StooltypeOne. Stool_type_var2 Stooltypetwo. 
Water_var1 WaterOne. watertype watering. Water_var2 WaterTwo. Special_Diet_var Special_DietOne.  RawEggs_var Raw_EggsOne. Turkey_var TurkeyOne. Chicken_var ChickenOne. 
Poultry_var PoultryOne. Beef_var BeefOne.  Pork_var PorkOne. Redmeat_var RedmeatOne. RawFruits_var RawFruitsOne. Delimeat_var DelimeatOne.  
Leafygreens_var Leafygreensone. Rawveggies_var Rawveggiesone. Travel_var1 TravelOne.  Travel_var2 TravelTwo. Travel_var3 TravelThree. 
Travel_var4 TravelFour. traveltype abroad. Animalcontact_var  Animal_contactone. Reptiles_var  ReptilesOne. Livestock_var LivestockOne. Bird_Poultry_var Bird_PoultryOne.
Pets_var1 PetsOne. Pets_var2 PetsTwo. food_consump_var foodconsumptionONE. all_clades all_clades. clade1 clade1A_F. subclade_df epitable. clades_var clades_var. clades_var1 clades_varONE. clades_var2 clades_varTWO. 
clades_var3 clades_varTHREE. clades_var1A clades_varONEA. clades_var1B clades_varONEB. clades_var1C clades_varONEC. clades_var1D clades_varONED. clades_var1E clades_varONEE. clades_var1F clades_varONEF.;
 run;

/****************************************************************************************************************************************************
******************************************************************************************************************************************************
CHECKING VARIABLES 
*******************************************************************************************************************************************************
*******************************************************************************************************************************************************/
proc sort; by  Age_group2;
run; 
proc print;
var AccessionNum clade clade1 all_clades subclade_df; 
run; 
proc print;
var any abxprofile tet_nocip onlytet_nocip tetvscip cipciptet_nomacro tetvscip_nomacro; 
run; 

proc sort; by cowdensitygrp;
run; 
proc print; 
var cowdensitygrp densecows ;
run;
proc sort; by traveltype;
run;
proc print; 
var travel_pastmonth traveltype travel_inUS domtravel travel_outus inttravel ;
run;
proc print data=clades; 
  title 'Clades Data Combined';
  var AccessionNum clade st cc blaOXA_61 blaOXA_184 blaOXA_193 blaOXA_447 blaOXA_449 blaOXA_460	blaOXA_461 
blaOXA_465 blaOXA_466 aph3_III tet_O tet_O_32_O gyrA_T86I rpsL_K43R;
run; 
proc sort; by Year_var;
run; 
proc print;
var year Year_var ; 
run;
/***Difference in proportions**/
proc freq data= clades; 
title 'Difference in proportions _ clades'; 
table (all_clades)/chisq missprint; 
run; 

proc sort; by Travel_var1; /*no sig diff in porportions for IB,ID,III but clade 2 was significant different and greater in MI (no travel) */

proc freq data= clades; where clades_var1C=1; /*no diff for subclade Ia or Ic either*/
title 'Difference in proportions of subclades by travel'; 
table (Travel_var1)/chisq missprint; 
run; 
proc freq data=clades;
title 'travel by STs, CCs, hosts';
table Travel_var1 *(st cc host)/chisq missprint;
run;
proc freq data= clades; where host='Generalist'; /*almost sig for cattle (p=0.06),not sig for chicken */
title 'Difference in proportions of host by travel'; 
table (Travel_var1)/chisq missprint; 
run; 

proc freq data= clades; where clades_var1F=1; /*no diff for subclade Ia, IB, Ic, IE, IF, and clade III, but subclade ID and clade II was sig greater in urban */
title 'Difference in proportions of subclades by rural'; 
table (Residence_var2)/chisq missprint; 
run; 

proc freq data= clades; 
title 'Clades by ST and cc'; 
table all_clades*(st cc)/chisq missprint; 
run;
proc freq data= clades; 
title 'Clades by AbxR'; 
table all_clades*(any abxprofile anycip anytet)/chisq missprint; 
run;
proc freq data= clades; 
title 'Clades by AbxR'; 
table clade1*(any abxprofile anycip anytet)/chisq missprint; 
run;
proc freq data= clades; 
title 'clades by ARGs'; 
table all_clades*(blaOXA_61 blaOXA_184 blaOXA_193 blaOXA_447 blaOXA_449 blaOXA_460	blaOXA_461 
blaOXA_465 blaOXA_466 aph3_III tet_O tet_O_32_O gyrA_T86I rpsL_K43R)/chisq missprint; 
run;
proc freq data= clades; 
title 'ARG frequencies'; 
table blaOXA_61 blaOXA_184 blaOXA_193 blaOXA_447 blaOXA_449 blaOXA_460	blaOXA_461 
blaOXA_465 blaOXA_466 aph3_III tet_O tet_O_32_O gyrA_T86I rpsL_K43R/missprint; 
run;

/******** phylogeogrpahic temporal analysis i.e. year and county,residence*************/
proc freq data= clades;
title 'year and residence vs clades';
table (all_clades clade1)*(year residence_type residence_var2 urban)/chisq missprint; 
run;
proc freq data= clades;
title 'year vs clades';
table (all_clades clades_var clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B 
clades_var1C clades_var1D clades_var1E clades_var1F)*(year)/chisq missprint; 
run; 
proc freq data =  clades; 
title 'clades vs residence'; 
table (all_clades clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C 
clades_var1D clades_var1E clades_var1F)*(residence_var2)/chisq missprint exact or; 
run; 
proc freq data =  clades; 
title 'clades vs residence'; 
table (subclade_df)*(residence_var2)/chisq missprint; 
run; 
proc sort data=clades; by subclade_df;
proc freq data =  clades; 
title 'clades vs residence'; 
table (residence_var2)*subclade_df* st/chisq missprint; 
run;
proc freq data =  clades; 
title 'clades vs symptoms'; 
table clade1* (abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var 
chills_var fatigue_var headache_var nausea_var)/chisq missprint; 
run;
proc sort data=clades; by subclade_df;
proc freq data =  clades; 
title 'clades vs sts'; 
table (residence_var2)* st/chisq missprint; 
run;
proc freq data =  clades; 
title 'clades vs host'; 
table (residence_var2)*(host)/chisq missprint; 
run; 

/**Outcomes: Identifying outcomes that are associated with different clades**/
proc freq data= clades;
title "subclades by hospitalization"; 
tables (hospital_status_var)*(all_clades clade1 clades_var2 clades_var3 clades_var1A clades_var1B 
clades_var1C clades_var1D clades_var1E clades_var1F)/chisq missprint;
exact or;
run; 
proc freq data = clades; /*Clade 2 is associated with hospitalization relative to all others **/ 
title 'clades by hospitalization'; 
tables (hospital_status_var)*(clades_var2)/chisq missprint;
exact or; run;

proc sort data=clades; by subclade_df;
proc freq data=clades; /*SM: Table 2 data*/
title "difference in proportions";
table (hospital_var season sex_var age_group2 race_var1 Ethnicity_var1 Ethnicity_var2 county_var2 
Residence_var2 cowdensitygrp traveltype poultry_var livestock_var watertype 
poultry_var chicken_var beef_var RawFruits_var LeafyGreens_Var Pets_var2 Pets_var1 
reptiles_Var age0_18 age_19 Animalcontact_var age_41)* clade1/chisq missprint;
run;

proc freq data=clades; 
title "Travel by clades";
table (Travel_var1 traveltype)* (clade1 all_clades)/chisq missprint;
run;
proc freq data=clades; 
title "Travel by rural";
table Travel_var1 *rural/chisq missprint;
run;
/*Predictors of clade 1- final model*/
proc logistic descending; 
title "Predictors of clade 1";
model clades_var1 = otherrace age_19 female inttravel rural
animalcontact_var/selection=forward details lackfit;
run;
/*Predictors of clade 1- adding one variable at a time to determine if any others are linked
These variables were any (any abxR), hospital_var (hospitalization), and densecows (high cattle density)*/
proc logistic descending; 
title "Predictors of clade 1";
model clades_var1 = otherrace age_19 female inttravel rural animalcontact_var any /lackfit;
run;
/*Getting ORs for all variables without selection and running the homor-lemeshow goodness of fit test*/
proc logistic descending; 
title "Predictors of clade 1";
model clades_var1 = otherrace age_19 female inttravel rural animalcontact_var /lackfit;
run;

proc freq;
title 'age by rural- confounder?';
table (Age_group2)* rural;
run;

/* resistnace phenotypes vs. clade variables */
proc freq data =  clades; 
title 'clades vs resistance phenotypes'; 
table (clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D 
clades_var1E clades_var1F)*(ciponly anycip tetonly sheet1_TET)/chisq missprint exact or; 
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
table (clades_var1 clades_var2 clades_var3 clades_var1A clades_var1B clades_var1C clades_var1D 
clades_var1E clades_var1F)*(residence_var2 urban)/chisq missprint exact or; 
run; 
proc freq data =  clades; 
title "clades";
table (clade ST CC Host);
run;
/*Michigan Specific Isolates*/
proc freq data =  clades;
where Clades = 1;
title "clades";
table (clade ST CC Host);
run;
/**Residence and genomic variables*/
proc freq data =  clades; 
title "clades";
table (Clade ST CC Host)*(residence_var2);
run;

proc freq data = clades;
title "clades";
where residence_var2 = 1;
table (clade);
run;
proc sort; by AccessionNum; 
run; 
proc print; 
var residence_var2 AccessionNum;
run;
proc freq data= clades;
table (inttravel domtravel);
run; 

/*************************
AIM1 Analysis Rodrigues Frontiers et al. State_var=1 different isolates being described here ( three identified outside of Michigan excluded) ***/ 
/****Differences in proportions*/
proc freq data=resist; 
title 'Difference in proportions'; where state_var=1;
table (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var 
chills_var fatigue_var headache_var nausea_var)/chisq missprint; 
run; 
proc freq data=resist;
title "difference in proportions by travel history stratified by season"; where state_var=1;
table (Travel_pastmonth)*season/chisq missprint;
run;
proc freq data=resist; /*SM: Table S1 data; age ranges were changed variables based on the distribution, used age_group2 for the Table*/
title "difference in proportions"; where state_var=1;
table (hospital_var year season sex_var age_group2 race_var1 Ethnicity_var1 Ethnicity_var2 county_var2 
Residence_var2 cowdensitygrp traveltype poultry_var animalcontact_var livestock_var watertype 
poultry_var chicken_var beef_var RawFruits_var LeafyGreens_Var Pets_var2 Pets_var1 
reptiles_Var)/chisq missprint;
run;
proc freq data=resist; 
title 'Resistance frequencies'; where state_var=1;
table (any Sheet1_AZI Sheet1_CIP Sheet1_ERY Sheet1_GEN Sheet1_TET Sheet1_FFN Sheet1_TEL Sheet1_CLI)/chisq missprint; 
run; 
proc freq data=resist; 
title 'Resistance frequencies and phenotype combinations'; where state_var=1;
table (any abxprofile tet_nocip anycip tetvscip anycipvsall onlytet_nocip)/chisq missprint; 
run; 
proc freq data=resist;
title "phenotype by year"; where state_var=1;
table (abxprofile abxRnumb tetonly mdr ciptet ciponly)*(year)/chisq missprint; 
run; 
proc freq data=resist;
title "any abx by year"; where state_var=1;
table (any Sheet1_CIP Sheet1_TET Sheet1_CLI Sheet1_ERY)*(year)/chisq missprint; 
run; 

/*SM urban vs. rural numbers************************/
proc freq data=resist; 
title "Urban vs. Rural Risk Factors for disease"; where state_var=1;
tables (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var 
chills_var fatigue_var headache_var nausea_var)*(residence_var2)/chisq missprint; 
run;

/*****SM associations with hospitalization***********/
proc freq data=resist; where state_var = 1; 
table (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var fatigue_var headache_var nausea_var)*(hospital_status_var)/chisq missprint; 
run; 
proc freq data=resist; where state_var = 1; 
table (domtravel inttravel)*(hospital_status_var)/chisq missprint; 
run; 

/********SM Multivariate analysis with hospitalization*********/
/***Univariate variables <0.2 are: summerfall age_65 age41_65 
female domtravel inttravel otherrace Fatigue_var Nausea_var
Also tried age_years (continuous variable)
**************************************************************/
proc logistic data=resist; where state_var=1; /*FINAL model only uses 133 of the 214 patient records****/
title "Predictors of hospitilization";
model hospital_status_var = summerfall age_65 age41_65 
female domtravel inttravel otherrace Fatigue_var Nausea_var/ selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; /*only uses 144 of the 214 patient records****/
title "Predictors of hospitilization";
model hospital_status_var = summerfall age_65 age41_65 
female domtravel inttravel / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; /*only uses 136 of the 214 patient records****/
title "Predictors of hospitilization";
model hospital_status_var = summerfall age_65 age41_65 
female inttravel otherrace/ selection=forward details lackfit;
run;

/********SM analysis to identify factors associated with resistance*/
proc freq data=resist; where state_var = 1;
title "Associations with any resistance"; 
table (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var fatigue_var headache_var nausea_var hospital_status_var)*(any)/chisq missprint; 
run; 
proc freq data=resist; where state_var = 1; 
title "Associations with any ciprofloxacin resistance relative to all other"; 
table (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype Travel_var1 animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var fatigue_var headache_var nausea_var hospital_status_var poultry_var )*(anycipvsall)/chisq missprint; exact or;
run; 
proc freq data=resist; where state_var = 1; 
title "Associations with tetracycline resistance only relative to all other"; 
table (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype Travel_var1 animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var fatigue_var headache_var nausea_var hospital_status_var poultry_var)*(onlytet_nocip)/chisq missprint; exact or;
run; 

proc sort data=resist; 
by Travel_var1; run;
proc freq data=resist; where state_var = 1; by Travel_var1;
title "Travel history by cip and tet by year"; /*No signficant differences*/
table (year)*(onlytet_nocip anycipvsall)/chisq missprint; exact or;
run;
proc freq data=resist; where state_var = 1; by Travel_var1;
title "Differences in proportions cip/tet and mdr frequencies by travel history ";
table (tetvscip mdr tetvscip_nomacro)/chisq missprint; 
run;  

proc freq data=resist; where state_var = 1; /*cip variable, tetvscip, contains those with cip plus macrolideR; excluding macrolides doesn't change associations*/
title "Tet vs cip analysis to identify predictors of one or the other"; 
table (sex_var age_group2 race_var2 Ethnicity_var1 Ethnicity_var2 Residence_var2 cowdensitygrp
traveltype Travel_var1 animalcontact_var livestock_var watertype season abdominal_pain_var body_ache_var 
bloody_stool_var fatigue_var headache_var nausea_var hospital_status_var poultry_var)*(tetvscip)/chisq missprint; exact or;
run; 

/*****SM multivariate analysis to identify predictors of CIP resistance***********/
proc logistic data=resist; where state_var=1; /*BASE model only uses 43 anycip of the 115 abxR patient records****/
title "Predictors of Any CipR"; /* Hosmer and Lemeshow Goodness-of-Fit Test P=0.64, DF=8; X2 10.3*/ 
model tetvscip = age_years female urban inttravel /lackfit risklimits;
run;
proc logistic data=resist; where state_var=1; /*Adding travel variables to the base model only uses 34 anycip of the 87 abxR patient records****/
title "Predictors of Any CipR- adding to the base model"; /*High OR for hospitalizatin and cipR, but not significant*/
model tetvscip = age_years female urban Hospital_Status_var/ lackfit;
run;
proc logistic data=resist; where state_var=1; /*Adding well water****/
title "Predictors of Any CipR- adding to the base model";  /*No association between well water and cip*/
model tetvscip = age_years female urban wellwater/lackfit risklimits ;
run;
proc logistic data=resist; where state_var=1; /*Adding Arab ethnicity****/
title "Predictors of Any CipR- adding to the base model";  /*No association between Arab ethnicity and cip*/
model tetvscip = age_years female urban Ethnicity_var2/lackfit risklimits ;
run;
proc logistic data=resist; where state_var=1; /*Adding summer fall season****/
title "Predictors of Any CipR- adding to the base model"; /*No association between summerfall and cip*/
model tetvscip = age_years female urban summerfall/lackfit risklimits ;;
run; 
proc logistic data=resist; where state_var=1; /*Adding summer fall season****/
title "Predictors of Any CipR- adding to the base model"; /*No association between livestock and cip*/
model tetvscip = age_years female urban Livestock_var/lackfit risklimits ;
run; 


proc freq data=resist; where state_var=1;
title 'Summer/fall relationship with travel'; /*season is not linked to travel*/
table summerfall*(Travel_var1 domtravel inttravel)/chisq missprint;
run;
proc freq data=resist; where state_var=1;
title 'Summer relationship with travel';
table season_var3* (Travel_var1 domtravel inttravel)/chisq missprint;
run;


/****************************************************************************************
***********************************************************************************************
AGE GROUP ANALYSIS 
/** Assessing different age groups here used output to create final age groups above**/
proc freq data=resist; where state_var = 1; 
table (agegroup2_var)(agegroup2_var1)(agegroup2_var2)(agegroup2_var3)(agegroup2_var4)/chisq missprint; 
exact pchi or; 
run; 

/* Age_Group by hospitalization and travel to identify if there are specific age groups that are associated with these factors. Livestock contact was not signficantly different in the above data set*/ 
proc freq data=resist; 
title "agegroups by hospital and travel"; 
tables (agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5)*(hospital_status_var travel_var1 travel_var2 travel_var3 travel_var4)/chisq missprint; 
exact pchi or;
run; 
/*****************************************************************************
**************************
NEW AGE GROUPS ASSESSED HERE (old agegroups.. some older age group variables maybe broken
***************************************/
proc freq data = resist; where state_var = 1; 
title " final age groups"; 
tables (agegroup2_var)/chisq missprint; 
exact pchi or; 
run; 
/* VS hospitlization here use agegroupfinal variables vs 19-39 agegroup  */ 
proc freq data =  resist; where state_var = 1; 
title "final age groups vs. hospitialization";
tables ( agegroupfinal_var1 agegroupfinal_var2 agegroupfinal_var3 agegroupfinal_var4 )* (hospital_status_var)/chisq missprint;
exact pchi or; 
run; 
proc freq data =  resist; where state_var = 1; 
title "final age groups vs. residence type";
tables (agegroupfinal_var1 agegroupfinal_var2 agegroupfinal_var3 agegroupfinal_var4 agegroupfinal_var1 agegroupfinal_var2 agegroupfinal_var3 agegroupfinal_var4)*(residence_var2)/chisq missprint; 
exact pchi or; 
run;

/** Age groups vs. resistance phenotypes CIP, TET, CIPTET**/
proc freq data =  resist; where state_var = 1; 
title "final age groups vs. resistance phenotypes";
tables (agegroupfinal_var1 agegroupfinal_var2 agegroupfinal_var3 agegroupfinal_var4 agegroup2_var1 agegroup2_var2 agegroup2_var3 agegroup2_var3 agegroup2_var4)*(phenotype2 phenotype3 phenotype4 quinolone tet ciptet)/chisq missprint; 
exact pchi or; 
run; 

/*2x2 tables to study resistance. Resistance is defined as ANY, phenotype specific (i.e. CIPTET) and cip and macrolide alone
Resistance is the depdendent variable in this analysis
**************************************************************************************************************************************************************
**************************************************************************************************************************************************************
RISK FACTORS FOR DISEASE: */

/*Identifying Risk Factors for resistance phenotypes analysis was reported on CIP and TET resistanct infections*/
proc freq data=resist;
title "risk factors for resistant infections";where state_var=1;
tables (agegroup_var1 agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5 year season_var1 season_var2 season_var3 season_var4 sex_var race_var1 race_var2 ethnicity_var1 ethnicity_var2 hospital_var residence_var2 special_diet_var RawEggs_var Turkey_var Chicken_var Poultry_var Beef_var Pork_var Delimeat_var Redmeat_var Rawfruits_var Leafygreens_var Rawveggies_var animalcontact_var reptiles_var livestock_Var bird_poultry_var pets_var1 pets_var2 travel_var1 travel_var2 travel_var3 travel_var4 water_var1 water_var2)*(phenotype1 phenotype2 phenotype3 phenotype4 phenotype5 phenotype6 phenotype7 phenotype8 macrolide quinolone TET CIPTET)/chisq missprint;
exact pchi or;
run;
proc freq data=resist;
title "year vs. phenotype"; where state_var=1;
tables (year)*(phenotype1 phenotype2 phenotype3 phenotype4 phenotype5 phenotype6 phenotype7 phenotype8 phenotype9 phenotype10 macrolide quinolone TET)/chisq missprint;
exact pchi or;
run;
/**Outcomes associated with infection. Identifying outcomes that are associated with different resistant phenotypes**/
proc freq data=resist;
title "resistance by symptoms"; where state_var=1;
tables (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2 )*(phenotype1 phenotype2 phenotype3 phenotype4 phenotype5 phenotype6 phenotype7 phenotype8 phenotype9 phenotype10 macrolide quinolone TET)/chisq missprint;
exact pchi or;
run;
/**Outcomes associated with infection. Identifying outcomes that are associated with CIP as compared to TET**/
proc freq data=resist;
title "resistance by symptoms"; where state_var=1;
tables (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2 )*(CIPTET)/chisq missprint;
exact pchi or;
run;
/* TET only phenotype in univariate analysis was shown to be protective for hospitalization here we are looking at other influences that might effect this association*/ 
proc freq data=resist; 
title "hospitalization over time";
tables (hospital_status_var)*(year)/chisq missprint; 
exact pchi or; 
run; 

/***********************************************************************************
***********************************************************************************
URBAN VS RURAL ANALYSIS 
/
/* Looking at differences between Urban and Rural Risk Factors*/
proc freq data=resist; 
title "Urban vs. Rural Risk Factors for disease"; where state_var=1;
tables (season_var2 season_var3 season_var4 travel_var1 travel_var2 travel_var4 sex_var race_var2 ethnicity_var1 ethnicity_var2 agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5 animalcontact_var reptiles_var livestock_Var bird_poultry_var pets_var1 pets_var2 special_diet_var RawEggs_var Turkey_var Chicken_var Poultry_var Beef_var Pork_var Delimeat_var Redmeat_var Rawfruits_var Leafygreens_var Rawveggies_var water_var2)*(residence_var2)/chisq missprint; 
exact pchi or; 
run;

proc freq data=resist; 
title "Urban vs. Rural Risk Factors for disease"; where state_var=1;
tables (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2) *(residence_var2)/chisq missprint; 
exact pchi or; 
run;

/*****************************************************************************
*****************************************************************************
Analysis of severe disease phenotypes Hospitalization
/
/*markers for hospitalization*/ 
proc freq data=resist; 
title "markers vs. hospitlization"; where state_var=1; 
tables (travel_var1 travel_var2 travel_var4 animalcontact_var livestock_Var sex_var race_var2 agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5  abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2 )*(hospital_status_var)/chisq missprint; 
exact pchi or; 
run;
proc freq data=resist; 
title "markers vs. hospitlization"; where state_var=1; 
tables (agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5 agegroup_var6 agegroup_var7 agegroup_var8 )*(hospital_status_var)/chisq missprint; 
exact pchi or; 
run;
proc freq data=resist; 
title "Urban vs. Rural Risk Factors for disease"; where state_var=1;
tables (agegroup_var1 agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5 agegroup_var6 agegroup_var7 agegroup_var8) *(residence_var2)/chisq missprint; 
exact pchi or; 
run;
/* Looking at 2x2 tables utilizing CIPTET variables to see if exposures are more likely to be related to CIP or TET phenotypes. CIP=Any cip resistance within the group
TET=Any tet resistance within the group*/

proc freq data=resist; where state_var=1;
title "CipR vs TetR and demographic, epidemologic and outcome variables"; where state_var=1;
tables (season_var2 season_var3 season_var4 residence_var2 travel_var1 travel_var2 travel_var4 sex_var race_var2 ethnicity_var1 ethnicity_var2 agegroup_var2 agegroup_var3 agegroup_var4 agegroup_var5 animalcontact_var reptiles_var livestock_Var bird_poultry_var pets_var1 pets_var2 special_diet_var RawEggs_var Turkey_var Chicken_var Poultry_var Beef_var Pork_var Delimeat_var Redmeat_var Rawfruits_var Leafygreens_var Rawveggies_var water_var2)*(CIPTET)/chisq missprint; 
exact pchi or; 
run;

proc freq data=resist; where state_var=1;
title "CipR vs TetR and demographic, epidemologic and outcome variables"; where state_var=1;
tables (hospital_status_var abdominal_pain_var body_ache_var diarrhea_var bloody_stool_var chills_var fatigue_var headache_var nausea_var fever_var stool_type_var1 stool_type_var2) *(CIPTET)/chisq missprint; 
exact pchi or; 
run;
/***************************************************************************************************************
*************************************************************************************
Assessing interaction between variables /

 
/* Exploring Arab associations Arab vs. others to idenitfy interacting variables*/
proc freq data=resist; where state_var=1;
title "Arab ethinicty other variables"; 
tables (ethnicity_var2)*(phenotype1 county_var2 residence_var2 TET water_var2 travel_var4 travel_var1)/chisq missprint; 
exact pchi or; 
run;
proc freq data=resist; 
title "tet county";
tables ( agegroup_var2)*(livestock_var ethnicity_var2 TET phenotype1)/chisq missprint; 
exact pchi or; 
run;
proc freq data=resist; where state_var=1; where ethnicity_var2=1; 
title "arab subset";
tables (agegroup_var2)*(TET year_var1 ethnicity_var2)/chisq missprint; 
exact pchi or; 
run; 
proc freq data=resist; where state_var=1; 
title "arab"; 
tables (ethnicity_var2)*(TET poultry_var chicken_var beef_var)/chisq missprint; 
exact pchi or; 
run; /*food consumption variables are not associated with Arab*/
proc freq data=resist; where state_var=1; where county_var3=1; 
title "wayne county specific arab";
tables (ethnicity_var2)*(TET)/chisq missprint; 
exact pchi or; 
run; 
proc freq data=resist; where state_var=1;  where county_var3=1; where agegroup_var2=1; 
title "wayne county kids vs. no arab kids"; 
tables (ethnicity_var2)*(TET)/chisq missprint;
exact pchi or; 
run; 

proc freq data=resist; where state_var=1; 
title "kids vs tet"; 
tables (agegroup_var2)*(TET)/chisq missprint; 
exact pchi or; 
run;
/* this was used to create map figures which were not used in paper */ 
proc freq data=resist; where state_var=1;
title "tet for map"; 
table (county_var1)*(phenotype1 phenotype2 phenotype3 phenotype4 phenotype5 phenotype6 phenotype7 phenotype8 phenotype9 phenotype10 macrolide quinolone TET)/chisq missprint;
run;
/**********************************************************************************************************************
***********************************************************************************************************************
Multivariate Statistics to find independent risk factors for CIP and TET Resistant infections utilizing variablse with significant 
or strong associations from univariate analysis 
************************************************************************************************************************/
proc format; 
proc logistic data=resist; where state_var=1; /*travel past month vs. travel interational */
title "Quinolone resistance";
model Quinolone = agegroup_var2 sex_var residence_var2 travel_var1/ selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1;
title "Quinolone resistance";
model Quinolone = agegroup_var2 sex_var residence_var2 travel_var3 / selection=forward details lackfit;
run;
/** Checking different age groups in the mulitvariate model because of travel associations with age **/ 
/*0-9*/ 
proc  logistic data = resist; where state_var = 1; 
model Quinolone = agegroup2_var2 sex_var residence_var2 travel_var3 / selection =  forward detials lackfit; 
run; 
/* Adding variables one at a time */
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var1 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var2 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var2 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var3 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var4 sex_var /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var2 sex_var residence_var2 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = agegroup2_var1 sex_var residence_var2 travel_var3 /   details lackfit;
run;
proc logistic data =  resist; where state_var = 1; 
model Quinolone = race_var2 agegroup2_var1 sex_var residence_var2 travel_var1 /   details lackfit;
run;
/** Tetracycline resistance modeling**/ 

proc logistic data=resist; where state_var=1; 
title "tetracycline resistance";
model TET= race_var2 agegroup_var2 sex_var residence_var2 livestock_var water_var2 / selection=forward details lackfit;
run;
/*checking agegroups one at a time */ 

proc logistic data =  resist; where state_var = 1; 
model TET = agegroup2_var1 / details lackfit; 
run; 
proc logistic data =  resist; where state_var = 1; 
model TET = agegroup2_var2 / details lackfit; 
run; 
proc logistic data =  resist; where state_var = 1; 
model TET = agegroup2_var3 / details lackfit; 
run; 
proc logistic data =  resist; where state_var = 1; 
model TET = agegroup2_var4 / details lackfit; 
run; 
/*adding variables one at at time */ 
proc logistic data=resist; where state_var=1; 
title "tetracycline resistance";
model TET= agegroup2_var1 sex_var  / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "tetracycline resistance";
model TET= agegroup2_var1 sex_var residence_var2 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "tetracycline resistance";
model TET= agegroup2_var1 sex_var residence_var2 water_var2 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "tetracycline resistance";
model TET= race_var2 agegroup2_var1 sex_var residence_var2 water_var2 livestock_var/ selection=forward details lackfit;
run;


/** Modeling for markers for disease hospitalization **/ 
/*age groups**/
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var = agegroup2_var5 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var = agegroup2_var4 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var = agegroup2_var3 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var = agegroup2_var2 / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var = agegroup2_var1 / selection=forward details lackfit;
run;
/** one at a time 40-64 **/
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var residence_var2 / selection=forward details lackfit;
run;

proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var  residence_var2 nausea_var / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var residence_var2 nausea_var quinolone/ selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var  residence_var2 nausea_var fatigue_var quinolone / selection=forward details lackfit;
run;
/** >65 **/ 
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var5 sex_var / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var5 sex_var residence_var2 / selection=forward details lackfit;
run;

proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var5 sex_var  residence_var2 nausea_var / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var5 sex_var residence_var2 nausea_var quinolone/ selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var5 sex_var  residence_var2 nausea_var fatigue_var quinolone / selection=forward details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Hospitilization";
model hospital_status_var= race_var2 agegroup2_var4 sex_var  residence_var2 nausea_var fatigue_var quinolone / selection=forward details lackfit;
run;

/** Previous tests **/
/* model is not a good fit for this. International travel seems to be associated independently confounding variaables present trying
different age groups where there were signficant associations and removing race and ethnicity from the model*/
/*Age groups were tested in univariate and agegroup_var2/3/4 0-9,9-18,18-64 shown to have p>=0.25 in chi-sqare tested each group did not influence travel associated here 
in the model*/
proc logistic data=resist; where state_var=1;
model Quinolone =  agegroup_var2 sex_var travel_var3/ selection=forward slentry=0.25 slstay=0.10 details lackfit;
run;
proc logistic data=resist; where state_var=1; 
title "Arab";
model TET = agegroup_var2 county_var3 residence_var2 ethnicity_var2/ selection=forward slentry=0.25 slstay=0.10 details lackfit;
run;
