# AutosRUs: MechaCar Analysis

![logo](.Resources/Images/AutoRUs.png)


## Project Background
AutosRUs’ has a new car prototype named the MechaCar.  Unfortunately the manufacturing team is running into some trouble.  Not sure how to address the issue, upper management has asked the Data Analytics team, headed by Jeremy, to review and analyze the production data in hopes of uncovering the cause of their issues.

With the internal data supplied to the team via in 2 csv files: **MechaCar_mpg.csv** and **Suspension_Coil.csv**, the team gets to work with the power of **R** and its many libraries: tidyverse, dplyr, ggplot2.



## Linear Regression to Predict MPG
We start with a linear regression that explores the relationship of the miles per gallon performance (dependent variable) against the 5 other independent variables: 

* length of the vehicle
* weight of the vehicle
* spoiler angle
* ground clearance
* AWD: all wheel drive suspension

### Results:
<mark style="background-color: Yellow">**Resulting Model:**</mark> 

### mpg =  (6.267)**vehicle_length** + (0.0012)**vehicle_weight** + (0.0688)**spoiler_angle** + (3.546)**ground_clearance** + (-3.411)**AWD** + (-104.0)
				

<mark style="background-color: Yellow">**Statistical Summary:**</mark>  
![d1](./Images/linear_regression_d1.png)

From the above output we can see that:

1. The **vehicle length**, and **vehicle ground clearance** are statistically likely to provide non-random amounts of variance to the model. That is to say, the vehicle length and vehicle ground clearance have a significant impact on miles per gallon on the MechaCar prototype. Conversely,
the **vehicle weight**, **spoiler angle**, and **All Wheel Drive** (AWD) have p-Values that indicate a random amount of variance with the dataset.  

2. The p-Value for this model, ```p-Value: 5.35e-11```, is much smaller than the assumed significance level of 0.05%. This indicates there is sufficient evidence to **reject our null hypothesis**, which further indcates that the slope of this linear model is **not zero**.


3.  This linear model has an r-squared value of 0.7149, which means that approximately 71% of all mpg predictions will be determined by this model. Relatively speaking, his multiple regression model **does predict mpg of MechaCar prototypes effectively**. 

If we remove the less impactful independent variables (vehicle weight, spoiler angle, and All Wheel Drive), the predictability does decrease, but not drastically: the r-squared value falls from 0.7149 to 0.674. 

![d1](./Images/new_linear_regression_d1.png)

## Summary Statistics on Suspension Coils

The Suspension Coil dataset provided for the MechaCar contains the results of testing the weight capacities of multiple suspension coils from multiple production lots to determine consistency. 

First looking at all manufacturing lots:

![d2](./Images/total_lot_summary.png)

Diving a little deeper into each of the 3 lots:

![d2](./Images/manufactoring_lot_summary.png)

With the understanding that the design specifications for the MechaCar suspension coils mandate that <mark style="background-color: Yellow">**the variance of the suspension coils cannot exceed 100 pounds per square inch (PSI)**</mark> . 

Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

When looking at the entire population of the production lot, the variance of the coils is 62.29 PSI, which is well within the 100 PSI variance requirement.  

Similarly, but significantly more consistent, Lot 1 and Lot 2 are well within the 100 PSI variance requirement; with variances of 0.98 and 7.47 respectively.  However, it is Lot 3 that is showing much larger variance in performance and consistency, with a variance of 170.29.  It is Lot 3 that is disproportionately causing the variance at the full lot level.  

This very simple boxplot illustrates the differences between the lots:

![d2](./Images/boxplot2.png)

## t-Tests on Suspension Coils
The next step is to conduct a t-test on the suspension coil data to determine whether there is a statistical difference between the mean of this provided sample dataset and a hypothesized, potential population dataset. Using the presumed **population mean of 1500**, we find the following:

There is a summary of the t-test results across <mark style="background-color: Yellow">**all manufacturing lots**</mark>
![d3](./Images/t_test_all.png)

From here we can see the **true mean of the sample is 1498.78**, which we also saw in the summary statistics above.  With a **p-Value of 0.06**, which is higher than the common significance level of 0.05, there is **NOT enough evidence to support rejecting the null hypothesis**.  That is to say, the mean of all three of these manufacturing lots is statistically similar to the presumed population mean of 1500. 

<mark style="background-color: Yellow">**Next looking at each individual lots:**</mark>

1. Lot 1 sample actually has the **true sample mean of 1500**, again as we saw in the summary statistics above. With a **p-Value of 1**, clearly we cannot reject (i.e. accept) the null hypothesis that there is no statistical difference between the observed sample mean and the presumed population mean (1500).
2. Lot 2 has essentially the same outcome with a **sample mean of 1500.02**, a **p-Value of 0.61**; the null hypothesis cannot be rejected, and the sample mean and the population mean of 1500 are statistically similar.
3. However, Lot 3, not surprisingly is a different scenario. Here **the sample mean is 1496.14** and the **p-Value is 0.04**, which is lower than the common significance level of 0.05.  All indicating to **reject the null hypothesis** that this sample mean and the presumed population mean are not statistically different.

 ![d3](./Images/t_test_lot.png)

How does this information help?  Clearly, something went awry in Lot 3's production cycle. The process needs to be checked for system fails and the suspension coils from this lot need to be inspected to remove those not meeting quality criteria.

## Study Design: MechaCar vs Competition

An example of a future study design for the MechaCar might involve 2 parts:
1. from a list of given factors, which are the statistically most relevant to determine the selling price for this genre of car
2. how does MechaCar stack up against its competition in perceived value (i.e. selling price set properly or not)

This study would involve collecting data on MechaCar and its comparable models across several different manufacturers over the last 3 years.

We start by answering some questions...

*  what are the competitions' comparable models, ***which cars will MechaCar be competing with head-to-head? which cars will be included in the study?***
*   what factors will the study look at to determine the top statistically relevant to selling price.
 

### Metrics
Collecting data for comparable models across all major manufacturers for past 3 years for the following metrics:

*  actual selling price: *dependent variable*
*  miles per gallon (fuel efficiency): *independent variable*
*  engine type (electric, hybrid, fuel): *independent variable*
*  residual value (or resale value): *independent variable*
*  average annual cost of ownership (maintenance): *independent variable*
*  Safety Rating (feature): *independent variable*
*  Drive Package (AWD, front, rear, four): *independent variable*

### Hypothesis: Null and Alternative
After determining which factors are key for the MechaCar's genre:

 * Null Hypothesis (Ho): MechaCar is priced correctly based on its performance of key factors for its genre.
 * Alternative Hypothesis (Ha): MechaCar is NOT priced correctly based on performance of key factors for its genre.
 
### Statistical Tests
A **multiple linear regression** would be used to determine the factors that have the highest correlation/predictability with the list selling price (dependent variable); which combination has the greatest impact on price (it may be all of them!)

Before any tests can be conducted, some of the nominal data will have to be transformed (engine type, car class, drive package).
