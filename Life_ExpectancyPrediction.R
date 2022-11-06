> data(state)
> statedata = data.frame(state.x77)
> str (statedata)
'data.frame':   50 obs. of  8 variables:
 $ Population: num  3615 365 2212 2110 21198 ...
 $ Income    : num  3624 6315 4530 3378 5114 ...
 $ Illiteracy: num  2.1 1.5 1.8 1.9 1.1 0.7 1.1 0.9 1.3 2 ...
 $ Life.Exp  : num  69 69.3 70.5 70.7 71.7 ...
 $ Murder    : num  15.1 11.3 7.8 10.1 10.3 6.8 3.1 6.2 10.7 13.9 ...
 $ HS.Grad   : num  41.3 66.7 58.1 39.9 62.6 63.9 56 54.6 52.6 40.6 ...
 $ Frost     : num  20 152 15 65 20 166 139 103 11 60 ...
 $ Area      : num  50708 566432 113417 51945 156361 ...
> RegModel= lm(Life.Exp ~., data= statedata)
> summary (RegModel)

Call:
lm(formula = Life.Exp ~ ., data = statedata)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.48895 -0.51232 -0.02747  0.57002  1.49447 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  7.094e+01  1.748e+00  40.586  < 2e-16 ***
Population   5.180e-05  2.919e-05   1.775   0.0832 .  
Income      -2.180e-05  2.444e-04  -0.089   0.9293    
Illiteracy   3.382e-02  3.663e-01   0.092   0.9269    
Murder      -3.011e-01  4.662e-02  -6.459 8.68e-08 ***
HS.Grad      4.893e-02  2.332e-02   2.098   0.0420 *  
Frost       -5.735e-03  3.143e-03  -1.825   0.0752 .  
Area        -7.383e-08  1.668e-06  -0.044   0.9649    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7448 on 42 degrees of freedom
Multiple R-squared:  0.7362,    Adjusted R-squared:  0.6922 
F-statistic: 16.74 on 7 and 42 DF,  p-value: 2.534e-10

> Predictions = predict(RegModel)
> sum((statedata$Life.Exp - Predictions)^2)
[1] 23.29714
> sum (RegModel$residual^2)
[1] 23.29714
> RegModel2= lm (Life.Exp ~ Population + Murder + Frost + and HS.Grad, data= statedata) 
Error: unexpected symbol in "RegModel2= lm (Life.Exp ~ Population + Murder + Frost + and HS.Grad"
> RegModel2= lm (Life.Exp ~ Population + Murder + Frost + HS.Grad, data= statedata) 
> summary (RegModel2)

Call:
lm(formula = Life.Exp ~ Population + Murder + Frost + HS.Grad, 
    data = statedata)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.47095 -0.53464 -0.03701  0.57621  1.50683 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  7.103e+01  9.529e-01  74.542  < 2e-16 ***
Population   5.014e-05  2.512e-05   1.996  0.05201 .  
Murder      -3.001e-01  3.661e-02  -8.199 1.77e-10 ***
Frost       -5.943e-03  2.421e-03  -2.455  0.01802 *  
HS.Grad      4.658e-02  1.483e-02   3.142  0.00297 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7197 on 45 degrees of freedom
Multiple R-squared:  0.736,     Adjusted R-squared:  0.7126 
F-statistic: 31.37 on 4 and 45 DF,  p-value: 1.696e-12

> sum (REgModel2$residuals^2)
Error: object 'REgModel2' not found
> sum (RegModel2$residuals^2)
[1] 23.30804
> CARTmodel = rpart(Life.Exp ~ ., data=statedata)
> prp(CARTmodel)
> PredictionsCART = predict(CARTmodel)
> sum((statedata$Life.Exp - PredictionsCART)^2)
[1] 28.99848
> CARTmodel2 = rpart(Life.Exp ~ ., data=statedata, minbucket=5)
> prp (CARTmodel2)
> PredictionsCART2 = predict(CARTmodel2)
> sum ((statedata$Life.Exp ~PredictionsCART2) ^2)
Error in (statedata$Life.Exp ~ PredictionsCART2)^2 : 
  non-numeric argument to binary operator
> sum((statedata$Life.Exp - PredictionsCART2)^2)
[1] 23.64283
> CARTmodel3 = rpart(Life.Exp ~ Area, data=statedata, minbucket=1)
> prp (CARTmodel3)
> PredictionsCART3 = predict(CARTmodel3)
> sum ((statedata=Life.Exp ~PredictionsCART3)^2)
Error in (statedata = Life.Exp ~ PredictionsCART3)^2 : 
  non-numeric argument to binary operator
> sum((statedata=Life.Exp ~PredictionsCART3)^2)
Error in (statedata = Life.Exp ~ PredictionsCART3)^2 : 
  non-numeric argument to binary operator
> sum((statedata$Life.Exp ~PredictionsCART3)^2)
Error in (statedata$Life.Exp ~ PredictionsCART3)^2 : 
  non-numeric argument to binary operator
> sum((statedata$Life.Exp ~PredictionsCART3)^2)
Error in (statedata$Life.Exp ~ PredictionsCART3)^2 : 
  non-numeric argument to binary operator
> sum((statedata$Life.Exp - PredictionsCART3)^2)
[1] 0
> sum((statedata$Life.Exp - PredictionsCART3)^2)
[1] 0
> prp (CARTmodel3)
Warning message:
Cannot retrieve the data used to build the model (so cannot determine roundint and is.binary for the variables).
To silence this warning:
    Call prp with roundint=FALSE,
    or rebuild the rpart model with model=TRUE. 
> library (caret)
> set.seed (111)
> fitControl = trainControl(method = "cv", number = 10)
> cartGrid = expand.grid(.cp = seq(0.01, 0.5, 0.01) )
> train(Life.Exp ~ ., data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> train(Life.Exp ~ ., data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> train(Life.Exp ~ ., data=statedata, method="rpart", trcontrol = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> train(Life.Exp ~ ., data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> CARTmodel4 = rpart(Life.Exp ~ ., data=statedata, cp=0.12)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> library (rpart)
> library (caret)
> train(Life.Exp ~ ., data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> CARTmodel4 = rpart(Life.Exp ~ ., data=statedata, cp=0.12)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> library(data.table)
data.table 1.14.2 using 4 threads (see ?getDTthreads).  Latest news: r-datatable.com
> library (data.table)
> library (dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:data.table’:

    between, first, last

The following object is masked from ‘package:randomForest’:

    combine

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> CARTmodel4 = rpart(Life.Exp ~ ., data=statedata, cp=0.12)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> set.seed(111)
> 
> train(Life.Exp ~ Area, data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid )
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> train(Life.Exp ~ Area, data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> CARTmodel5 = rpart(Life.Exp ~ Area, data=statedata, cp=0.02)
Error in as.data.frame.default(data) : 
  cannot coerce class ‘"formula"’ to a data.frame
> 
