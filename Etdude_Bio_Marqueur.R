##### Projet UE Math décisonnelle

library(car)
library(ggpubr)
library(tidyverse)
library(lmtest)

## Test de Shaipro-Wilk : permet de savoir si une distribution suit une loi normale ou non

## Aggravation_INFILT

#shapiro.test(BDD_BMQ$Aggravation_INFILT)
#data:  BDD_BMQ$Aggravation_INFILT
#W = 0.92487, p-value = 0.00318

# p-value< 5% => on rejette l'hyphthèse de normalité

#powerTransform(BDD_BMQ$Aggravation_INFILT)
#Estimated transformation parameter 
#BDD_BMQ$Aggravation_INFILT 
#0.3961972 

#shapiro.test(as.numeric(BDD_BMQ_V2$Aggravation_INFILT_Normalise))
#W = 0.96608, p-value = 0.1361
#class(as.numeric(BDD_BMQ_V2$Aggravation_INFILT_Normalise))


#Histogramme basique

#Avant normalisation
#hist(as.numeric(BDD_BMQ_V2$Aggravation_INFILT)) # Histogramme
#qqnorm(as.numeric(BDD_BMQ_V2$Aggravation_INFILT)) 


#Après normalisation
#hist(as.numeric(BDD_BMQ_V2$Aggravation_INFILT_Normalise)) # Histogramme
#qqnorm(as.numeric(BDD_BMQ_V2$Aggravation_INFILT_Normalise))  # plus ca ressemble à une droite plus c'est normé

## Aggravation_INFILT_INF

#shapiro.test(BDD_BMQ$Aggravation_INFILT_INF)
#data:  BDD_BMQ$Aggravation_INFILT_INF
#W = 0.92693, p-value = 0.003806


## Aggravation_INFILT_SUP

#shapiro.test(BDD_BMQ$Aggravation_INFILT_SUP)
#data:  BDD_BMQ$Aggravation_INFILT_SUP
#W = 0.87167, p-value = 5.41e-05

######## RÉALISATION DES REG LINÉAIRES 1 VARIABLES


####   regresion Aggravation_INFILT en fonction de INFLAM

#reg <- lm(BDD_BMQ$Aggravation_INFILT~BDD_BMQ$INFLAM) 
#Coefficients:
#  (Intercept)  BDD_BMQ$INFLAM  
#0.1097          1.0905         2.94e-06
#plot(BDD_BMQ$INFLAM,BDD_BMQ$Aggravation_INFILT)


#summary(lm(BDD_BMQ_V2$Aggravation_INFILT_Normalise~BDD_BMQ$INFLAM)) 
#0.36863  1.24490   1.60e-06  0.365 0.3777

####     regresion Aggravation_INFILT en fonction de INFLAM_SUP

#reg = lm(BDD_BMQ$Aggravation_INFILT~BDD_BMQ$INFLAM_SUP) 
#Coefficients:
#  (Intercept)  BDD_BMQ$INFLAM_SUP  
#0.2275             -0.1437     0.668

#summary(lm(BDD_BMQ_V2$Aggravation_INFILT_Normalise~BDD_BMQ$INFLAM_SUP))
# 0.49688     0.02443   0.948    -0.02032   8.719e-05
#plot(BDD_BMQ_V2$INFLAM_SUP,BDD_BMQ_V2$Aggravation_INFILT_Normalise)

# p valeur = 0.998 > 5%  => H0 rejeté => la variable ne sera pas retenu

####     regresion Aggravation_INFILT en foction de INFLAM_INF

#reg = lm(BDD_BMQ$Aggravation_INFILT~BDD_BMQ$INFLAM_INF) 
#Coefficients:
#  (Intercept)  BDD_BMQ$INFLAM_INF  
#0.1118              0.7271       9.17e-08

#summary(lm(BDD_BMQ_V2$Aggravation_INFILT_Normalise~BDD_BMQ$INFLAM_INF))
# 0.37667   0.79358   2.37e-07  0.4115  0.4233

####       regresion Aggravation_INFILT en fonction de CSS

#reg = lm(BDD_BMQ$Aggravation_INFILT~BDD_BMQ$CSS) 
#Coefficients:
#  (Intercept)  BDD_BMQ$CSS  
#-0.22283      0.07524          1.01e-08


#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(BDD_BMQ$CSS), data=BDD_BMQ_V2))
#0.02267 0.07808  8.03e-07  0.3762  0.3884

####          regresion Aggravation_INFILT en fonction de Age_CSS

#summary(lm(BDD_BMQ_V2$Aggravation_INFILT_Normalise~BDD_BMQ$Age_CSS)) 
#Coefficients:
#  (Intercept)  BDD_BMQ$Age_CSS  
#0.070743         0.001337      0.00997

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(Age_CSS), data=BDD_BMQ_V2))
#0.3472506   0.0012357   0.0449   0.05957   0.07801


####          regresion Aggravation_INFILT_Normalise en fonction de SUP_MMT

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(SUP_MMT), data=BDD_BMQ_V2))
#1.44928  -0.01498  3.26e-09  0.497 0.5069


####        regresion Aggravation_INFILT_Normalise en fonction de BMQ(Biomarqueur)

#regmodel <- lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(BMQ), data=BDD_BMQ_V2)
#summary(regmodel)
#4.406e-01  6.294e-07  0.022  0.08417  0.1025


####          regresion Aggravation_INFILT_Normalise en fonction de INF_MMT

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(INF_MMT), data=BDD_BMQ_V2))
#1.164556 -0.016615 2.96e-08    0.4516  0.4624

####          regresion Aggravation_INFILT_Normalise en fonction de MMT

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT), data=BDD_BMQ_V2))
#1.466096   -0.009327  7.46e-11  0.5666  0.5751

####          regresion Aggravation_INFILT_Normalise en fonction de MWT

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MWT), data=BDD_BMQ_V2))
#0.8414946  -0.0008072  5.86e-07  0.3838  0.3959

####          regresion Aggravation_INFILT_Normalise en fonction de MFM

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MFM), data=BDD_BMQ_V2))
#1.269171 -0.009432 4.78e-07  0.3886  0.4006


######## RÉALISATION DES REG LINÉAIRES 2 VARIABLES

### regression a 2 variable entre Aggravation_INFILT_Normalise en fonction de MMT et BMQ

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MWT)+as.numeric(BMQ), data=BDD_BMQ_V2))
#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      8.138e-01  8.062e-02  10.094 1.86e-13 ***
#  as.numeric(MWT) -7.738e-04  1.565e-04  -4.945 9.72e-06 ***
#  as.numeric(BMQ)  1.487e-07  2.394e-07   0.621    0.537   
#Multiple R-squared:  0.4054,	Adjusted R-squared:  0.3806 
#F-statistic: 16.36 on 2 and 48 DF,  p-value: 3.816e-06


#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(BMQ), data=BDD_BMQ_V2))
#Residuals:
#  Min       1Q   Median       3Q      Max 
#-0.59303 -0.07883  0.01026  0.10828  0.16301 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      1.495e+00  1.442e-01  10.368 7.67e-14 ***
#  as.numeric(MMT) -9.574e-03  1.292e-03  -7.413 1.72e-09 ***
#  as.numeric(BMQ) -6.690e-08  2.062e-07  -0.324    0.747    
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 0.1393 on 48 degrees of freedom
#(13 observations deleted due to missingness)
#Multiple R-squared:  0.5816,	Adjusted R-squared:  0.5641 
#F-statistic: 33.35 on 2 and 48 DF,  p-value: 8.306e-10

# Y en fonction de sup_MMT et BMQ

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(SUP_MMT)+as.numeric(BMQ), data=BDD_BMQ_V2))

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)          1.435e+00  1.581e-01   9.073 5.53e-12 ***
#  as.numeric(SUP_MMT) -1.486e-02  2.332e-03  -6.371 6.78e-08 ***
#  as.numeric(BMQ)      5.555e-08  2.174e-07   0.255    0.799    

#Residual standard error: 0.1501 on 48 degrees of freedom
#(13 observations deleted due to missingness)
#Multiple R-squared:  0.5137,	Adjusted R-squared:  0.4935 
#F-statistic: 25.35 on 2 and 48 DF,  p-value: 3.058e-08

### Y en fonction de BMQ Infam_inf

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(INFLAM_INF)+as.numeric(BMQ), data=BDD_BMQ_V2))

#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)            3.402e-01  3.019e-02  11.271 5.86e-15 ***
#  as.numeric(INFLAM_INF) 7.582e-01  1.245e-01   6.092 1.95e-07 ***
#  as.numeric(BMQ)        5.651e-07  1.899e-07   2.977  0.00459 ** 
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.1431 on 47 degrees of freedom
#(14 observations deleted due to missingness)
#Multiple R-squared:  0.5147,	Adjusted R-squared:  0.494 
#F-statistic: 24.92 on 2 and 47 DF,  p-value: 4.181e-08


### Y en fct de INFLAM_INF et MMT

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(INFLAM_INF)+as.numeric(MMT), data=BDD_BMQ_V2))

#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)             1.2878253  0.1091548  11.798 8.61e-16 ***
#  as.numeric(INFLAM_INF)  0.3555370  0.0991670   3.585 0.000786 ***
#  as.numeric(MMT)        -0.0080350  0.0009482  -8.474 4.27e-11 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.09774 on 48 degrees of freedom
#(13 observations deleted due to missingness)
#Multiple R-squared:  0.7689,	Adjusted R-squared:  0.7593 
#F-statistic: 79.87 on 2 and 48 DF,  p-value: 5.359e-16

### Y en fct de INFLAM_INF et MMT et BMQ

#summary(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(INFLAM_INF)+as.numeric(MMT)+as.numeric(BMQ), data=BDD_BMQ_V2))

#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)             1.270e+00  1.299e-01   9.774 8.38e-13 ***
#  as.numeric(INFLAM_INF)  3.577e-01  1.022e-01   3.500  0.00104 ** 
#  as.numeric(MMT)        -7.918e-03  1.092e-03  -7.249 3.86e-09 ***
#  as.numeric(BMQ)         5.242e-08  1.490e-07   0.352  0.72654    
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.09882 on 46 degrees of freedom
#(14 observations deleted due to missingness)
#Multiple R-squared:  0.7735,	Adjusted R-squared:  0.7587 
#F-statistic: 52.35 on 3 and 46 DF,  p-value: 7.162e-15


### Test sur les résidu

## Test d'independance

#durbinWatsonTest(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MWT)+as.numeric(BMQ), data=BDD_BMQ_V2))
#lag Autocorrelation D-W Statistic p-value
#1      -0.1670422      2.319853    0.26
#Alternative hypothesis: rho != 0


#durbinWatsonTest(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(BMQ), data=BDD_BMQ_V2))
#lag Autocorrelation D-W Statistic p-value
#1       -0.183494      2.354441   0.208
#Alternative hypothesis: rho != 0


#Graphe pour voir si les 2 varaibles sont indépendant
#regre = lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(BMQ), data=BDD_BMQ_V2)
#acf(residuals(regre), main="Regression Aggrav = f(MMT,BMQ)")

## Test de normalite

#shapiro.test(residuals(reg))
#data:  residuals(reg)
#W = 0.95511, p-value = 0.05168

#shapiro.test(residuals(regre))
#data:  residuals(regre)
#W = 0.85458, p-value = 1.749e-05

# Test d'homogénéite

#bptest(regre)
#data:  reg
#BP = 0.039193, df = 2, p-value = 0.9806

#bptest(regre)
#data:  regre
#BP = 0.024029, df = 2, p-value = 0.9881

## Conclusion : Les 3 tests des résidus sont validés avec validation


### Test sur les résidu

Model_12 <- lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(INFLAM_INF), data=BDD_BMQ_V2)
Les_residus = residuals(Model_12)
### Test indépendance

#durbinWatsonTest(lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(INFLAM_INF), data=BDD_BMQ_V2))
#lag Autocorrelation D-W Statistic p-value
#1      -0.2991433       2.56174   0.032
#Alternative hypothesis: rho != 0

#acf(Les_residus, main="Regression Aggravation_Normalise = f(MMT,INFLAM_INF)")

### Test de normalite

#shapiro.test(residuals(Model_12))
#data:  residuals(Model_12)
#W = 0.97096, p-value = 0.2424

#hist(Les_residus) # Histogramme
#qqnorm(Les_residus)

### Test d'homogénéite

#bptest(Model_12)
#studentized Breusch-Pagan test
#data:  Model_12
#BP = 8.3399, df = 2, p-value = 0.01545
#plot(Model_12, which = 3) 

#### Prédiction de Aggravation_Normalisse de la maison en fonction de MMT et INFLMA_INF


predict(Model_12, newdata=data.frame(MMT=95,35,INFLAM_INF=0.3518), type='response')[1]

#newdata = BDD_BMQ_V2[-1,]
#Model_12_test <- lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(INFLAM_INF), data=newdata)
#summary(Model_12_test)

#alpha1 = 1.2862621
#beta1 = -0.0080241
#beta2 = 0.3714131 

res<- NULL
for (i in 1:nrow(BDD_BMQ_V2)) 
{
  
  train <- BDD_BMQ_V2[-i,]
  test <- BDD_BMQ_V2[i,]
  
  
  Model_prev <- lm(as.numeric(Aggravation_INFILT_Normalise)~as.numeric(MMT)+as.numeric(INFLAM_INF), data=train)

  a <- predict(Model_prev, newdata=test[,c("INFLAM_INF", "MMT")] , type='response')
  

  reel = as.numeric(test$Aggravation_INFILT_Normalise)
  
  res[i] = abs((reel-a)/reel)
  
}
  
#sd(abs(na.omit(res)))
#min(abs(na.omit(res)))
