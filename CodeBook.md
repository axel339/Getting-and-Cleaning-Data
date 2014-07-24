# Getting and Cleaning Data: Course Project

## Loading and summarizing the data

The 3 first columns have been defined in the processing step with run_analysis.R. They correspond respectively to the subject ID, the activity performed, and whether the subject is part of the training or the test set. All the other features have been selected so that the final dataset only considers the features calculating the mean or the standard deviation of a specific feature.

As the `summary` and `str` functions indicate, there are only 30 unique identifiers, 6 types of activities and 2 types of training (Test/Train). All the means and standard deviations of the other features have been normalized beforehand.



```r
df <- read.table("C:/Users/Axel/Dropbox/Getting and cleaning data/Data/Tidy.txt",header=TRUE)
summary(df)
```

```
##        ID                     Activity    Training_Type tBodyAcc.mean...X
##  Min.   : 1.0   LAYING            :1944   test :2947    Min.   :-1.000   
##  1st Qu.: 9.0   SITTING           :1777   train:7352    1st Qu.: 0.263   
##  Median :17.0   STANDING          :1906                 Median : 0.277   
##  Mean   :16.1   WALKING           :1722                 Mean   : 0.274   
##  3rd Qu.:24.0   WALKING_DOWNSTAIRS:1406                 3rd Qu.: 0.288   
##  Max.   :30.0   WALKING_UPSTAIRS  :1544                 Max.   : 1.000   
##  tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X tBodyAcc.std...Y 
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.000   Min.   :-1.0000  
##  1st Qu.:-0.0249   1st Qu.:-0.1210   1st Qu.:-0.992   1st Qu.:-0.9770  
##  Median :-0.0172   Median :-0.1086   Median :-0.943   Median :-0.8350  
##  Mean   :-0.0177   Mean   :-0.1089   Mean   :-0.608   Mean   :-0.5102  
##  3rd Qu.:-0.0106   3rd Qu.:-0.0976   3rd Qu.:-0.250   3rd Qu.:-0.0573  
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.000   Max.   : 1.0000  
##  tBodyAcc.std...Z tGravityAcc.mean...X tGravityAcc.mean...Y
##  Min.   :-1.000   Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.979   1st Qu.: 0.812       1st Qu.:-0.243      
##  Median :-0.851   Median : 0.922       Median :-0.144      
##  Mean   :-0.613   Mean   : 0.669       Mean   : 0.004      
##  3rd Qu.:-0.279   3rd Qu.: 0.955       3rd Qu.: 0.119      
##  Max.   : 1.000   Max.   : 1.000       Max.   : 1.000      
##  tGravityAcc.mean...Z tGravityAcc.std...X tGravityAcc.std...Y
##  Min.   :-1.0000      Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.1167      1st Qu.:-0.995      1st Qu.:-0.991     
##  Median : 0.0368      Median :-0.982      Median :-0.976     
##  Mean   : 0.0922      Mean   :-0.965      Mean   :-0.954     
##  3rd Qu.: 0.2162      3rd Qu.:-0.962      3rd Qu.:-0.946     
##  Max.   : 1.0000      Max.   : 1.000      Max.   : 1.000     
##  tGravityAcc.std...Z tBodyAccJerk.mean...X tBodyAccJerk.mean...Y
##  Min.   :-1.000      Min.   :-1.0000       Min.   :-1.0000      
##  1st Qu.:-0.987      1st Qu.: 0.0630       1st Qu.:-0.0186      
##  Median :-0.967      Median : 0.0760       Median : 0.0108      
##  Mean   :-0.939      Mean   : 0.0789       Mean   : 0.0079      
##  3rd Qu.:-0.930      3rd Qu.: 0.0913       3rd Qu.: 0.0335      
##  Max.   : 1.000      Max.   : 1.0000       Max.   : 1.0000      
##  tBodyAccJerk.mean...Z tBodyAccJerk.std...X tBodyAccJerk.std...Y
##  Min.   :-1.0000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.0316       1st Qu.:-0.991       1st Qu.:-0.985      
##  Median :-0.0012       Median :-0.951       Median :-0.925      
##  Mean   :-0.0047       Mean   :-0.640       Mean   :-0.608      
##  3rd Qu.: 0.0246       3rd Qu.:-0.291       3rd Qu.:-0.222      
##  Max.   : 1.0000       Max.   : 1.000       Max.   : 1.000      
##  tBodyAccJerk.std...Z tBodyGyro.mean...X tBodyGyro.mean...Y
##  Min.   :-1.000       Min.   :-1.0000    Min.   :-1.0000   
##  1st Qu.:-0.989       1st Qu.:-0.0458    1st Qu.:-0.1040   
##  Median :-0.954       Median :-0.0278    Median :-0.0748   
##  Mean   :-0.763       Mean   :-0.0310    Mean   :-0.0747   
##  3rd Qu.:-0.548       3rd Qu.:-0.0106    3rd Qu.:-0.0511   
##  Max.   : 1.000       Max.   : 1.0000    Max.   : 1.0000   
##  tBodyGyro.mean...Z tBodyGyro.std...X tBodyGyro.std...Y tBodyGyro.std...Z
##  Min.   :-1.0000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.: 0.0648    1st Qu.:-0.987    1st Qu.:-0.982    1st Qu.:-0.985   
##  Median : 0.0863    Median :-0.902    Median :-0.911    Median :-0.882   
##  Mean   : 0.0884    Mean   :-0.721    Mean   :-0.683    Mean   :-0.654   
##  3rd Qu.: 0.1104    3rd Qu.:-0.482    3rd Qu.:-0.446    3rd Qu.:-0.338   
##  Max.   : 1.0000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyGyroJerk.mean...X tBodyGyroJerk.mean...Y tBodyGyroJerk.mean...Z
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.1172        1st Qu.:-0.0587        1st Qu.:-0.0794       
##  Median :-0.0982        Median :-0.0406        Median :-0.0546       
##  Mean   :-0.0967        Mean   :-0.0423        Mean   :-0.0548       
##  3rd Qu.:-0.0793        3rd Qu.:-0.0252        3rd Qu.:-0.0317       
##  Max.   : 1.0000        Max.   : 1.0000        Max.   : 1.0000       
##  tBodyGyroJerk.std...X tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.992        1st Qu.:-0.993       
##  Median :-0.935        Median :-0.955        Median :-0.950       
##  Mean   :-0.731        Mean   :-0.786        Mean   :-0.740       
##  3rd Qu.:-0.486        3rd Qu.:-0.627        3rd Qu.:-0.510       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  tBodyAccMag.mean.. tBodyAccMag.std.. tGravityAccMag.mean..
##  Min.   :-1.000     Min.   :-1.000    Min.   :-1.000       
##  1st Qu.:-0.982     1st Qu.:-0.982    1st Qu.:-0.982       
##  Median :-0.875     Median :-0.844    Median :-0.875       
##  Mean   :-0.548     Mean   :-0.591    Mean   :-0.548       
##  3rd Qu.:-0.120     3rd Qu.:-0.242    3rd Qu.:-0.120       
##  Max.   : 1.000     Max.   : 1.000    Max.   : 1.000       
##  tGravityAccMag.std.. tBodyAccJerkMag.mean.. tBodyAccJerkMag.std..
##  Min.   :-1.000       Min.   :-1.000         Min.   :-1.000       
##  1st Qu.:-0.982       1st Qu.:-0.990         1st Qu.:-0.991       
##  Median :-0.844       Median :-0.948         Median :-0.929       
##  Mean   :-0.591       Mean   :-0.649         Mean   :-0.628       
##  3rd Qu.:-0.242       3rd Qu.:-0.296         3rd Qu.:-0.273       
##  Max.   : 1.000       Max.   : 1.000         Max.   : 1.000       
##  tBodyGyroMag.mean.. tBodyGyroMag.std.. tBodyGyroJerkMag.mean..
##  Min.   :-1.000      Min.   :-1.000     Min.   :-1.000         
##  1st Qu.:-0.978      1st Qu.:-0.978     1st Qu.:-0.992         
##  Median :-0.822      Median :-0.826     Median :-0.956         
##  Mean   :-0.605      Mean   :-0.662     Mean   :-0.762         
##  3rd Qu.:-0.245      3rd Qu.:-0.394     3rd Qu.:-0.550         
##  Max.   : 1.000      Max.   : 1.000     Max.   : 1.000         
##  tBodyGyroJerkMag.std.. fBodyAcc.mean...X fBodyAcc.mean...Y
##  Min.   :-1.000         Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.992         1st Qu.:-0.991    1st Qu.:-0.979   
##  Median :-0.940         Median :-0.946    Median :-0.864   
##  Mean   :-0.778         Mean   :-0.623    Mean   :-0.537   
##  3rd Qu.:-0.609         3rd Qu.:-0.265    3rd Qu.:-0.103   
##  Max.   : 1.000         Max.   : 1.000    Max.   : 1.000   
##  fBodyAcc.mean...Z fBodyAcc.std...X fBodyAcc.std...Y  fBodyAcc.std...Z
##  Min.   :-1.000    Min.   :-1.000   Min.   :-1.0000   Min.   :-1.000  
##  1st Qu.:-0.983    1st Qu.:-0.993   1st Qu.:-0.9769   1st Qu.:-0.978  
##  Median :-0.895    Median :-0.942   Median :-0.8326   Median :-0.840  
##  Mean   :-0.665    Mean   :-0.603   Mean   :-0.5284   Mean   :-0.618  
##  3rd Qu.:-0.366    3rd Qu.:-0.249   3rd Qu.:-0.0922   3rd Qu.:-0.302  
##  Max.   : 1.000    Max.   : 1.000   Max.   : 1.0000   Max.   : 1.000  
##  fBodyAccJerk.mean...X fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.985        1st Qu.:-0.987       
##  Median :-0.952        Median :-0.926        Median :-0.948       
##  Mean   :-0.657        Mean   :-0.629        Mean   :-0.744       
##  3rd Qu.:-0.327        3rd Qu.:-0.264        3rd Qu.:-0.513       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  fBodyAccJerk.std...X fBodyAccJerk.std...Y fBodyAccJerk.std...Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.987       1st Qu.:-0.990      
##  Median :-0.956       Median :-0.928       Median :-0.959      
##  Mean   :-0.655       Mean   :-0.612       Mean   :-0.781      
##  3rd Qu.:-0.320       3rd Qu.:-0.236       3rd Qu.:-0.590      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  fBodyGyro.mean...X fBodyGyro.mean...Y fBodyGyro.mean...Z
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000    
##  1st Qu.:-0.985     1st Qu.:-0.985     1st Qu.:-0.985    
##  Median :-0.892     Median :-0.920     Median :-0.888    
##  Mean   :-0.672     Mean   :-0.706     Mean   :-0.644    
##  3rd Qu.:-0.384     3rd Qu.:-0.473     3rd Qu.:-0.323    
##  Max.   : 1.000     Max.   : 1.000     Max.   : 1.000    
##  fBodyGyro.std...X fBodyGyro.std...Y fBodyGyro.std...Z fBodyAccMag.mean..
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    
##  1st Qu.:-0.988    1st Qu.:-0.981    1st Qu.:-0.986    1st Qu.:-0.985    
##  Median :-0.905    Median :-0.906    Median :-0.891    Median :-0.875    
##  Mean   :-0.739    Mean   :-0.674    Mean   :-0.690    Mean   :-0.586    
##  3rd Qu.:-0.522    3rd Qu.:-0.438    3rd Qu.:-0.417    3rd Qu.:-0.217    
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    
##  fBodyAccMag.std.. fBodyBodyAccJerkMag.mean.. fBodyBodyAccJerkMag.std..
##  Min.   :-1.000    Min.   :-1.000             Min.   :-1.000           
##  1st Qu.:-0.983    1st Qu.:-0.990             1st Qu.:-0.991           
##  Median :-0.855    Median :-0.929             Median :-0.925           
##  Mean   :-0.659    Mean   :-0.621             Mean   :-0.640           
##  3rd Qu.:-0.382    3rd Qu.:-0.260             3rd Qu.:-0.308           
##  Max.   : 1.000    Max.   : 1.000             Max.   : 1.000           
##  fBodyBodyGyroMag.mean.. fBodyBodyGyroMag.std..
##  Min.   :-1.000          Min.   :-1.000        
##  1st Qu.:-0.983          1st Qu.:-0.978        
##  Median :-0.876          Median :-0.828        
##  Mean   :-0.697          Mean   :-0.700        
##  3rd Qu.:-0.451          3rd Qu.:-0.471        
##  Max.   : 1.000          Max.   : 1.000        
##  fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std..
##  Min.   :-1.000              Min.   :-1.000            
##  1st Qu.:-0.992              1st Qu.:-0.993            
##  Median :-0.945              Median :-0.938            
##  Mean   :-0.780              Mean   :-0.792            
##  3rd Qu.:-0.612              3rd Qu.:-0.644            
##  Max.   : 1.000              Max.   : 1.000
```

```r
str(df)
```

```
## 'data.frame':	10299 obs. of  69 variables:
##  $ ID                         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ Activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ Training_Type              : Factor w/ 2 levels "test","train": 2 2 2 2 2 2 2 2 2 2 ...
##  $ tBodyAcc.mean...X          : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc.mean...Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc.mean...Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tBodyAcc.std...X           : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc.std...Y           : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc.std...Z           : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tGravityAcc.mean...X       : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tGravityAcc.mean...Y       : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
##  $ tGravityAcc.mean...Z       : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
##  $ tGravityAcc.std...X        : num  -0.985 -0.997 -1 -0.997 -0.998 ...
##  $ tGravityAcc.std...Y        : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
##  $ tGravityAcc.std...Z        : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
##  $ tBodyAccJerk.mean...X      : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk.mean...Y      : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk.mean...Z      : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyAccJerk.std...X       : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk.std...Y       : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk.std...Z       : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyGyro.mean...X         : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
##  $ tBodyGyro.mean...Y         : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
##  $ tBodyGyro.mean...Z         : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
##  $ tBodyGyro.std...X          : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
##  $ tBodyGyro.std...Y          : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
##  $ tBodyGyro.std...Z          : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
##  $ tBodyGyroJerk.mean...X     : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
##  $ tBodyGyroJerk.mean...Y     : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
##  $ tBodyGyroJerk.mean...Z     : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
##  $ tBodyGyroJerk.std...X      : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
##  $ tBodyGyroJerk.std...Y      : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
##  $ tBodyGyroJerk.std...Z      : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
##  $ tBodyAccMag.mean..         : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tBodyAccMag.std..          : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tGravityAccMag.mean..      : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tGravityAccMag.std..       : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tBodyAccJerkMag.mean..     : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
##  $ tBodyAccJerkMag.std..      : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
##  $ tBodyGyroMag.mean..        : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
##  $ tBodyGyroMag.std..         : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
##  $ tBodyGyroJerkMag.mean..    : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
##  $ tBodyGyroJerkMag.std..     : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyAcc.mean...X          : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
##  $ fBodyAcc.mean...Y          : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
##  $ fBodyAcc.mean...Z          : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
##  $ fBodyAcc.std...X           : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
##  $ fBodyAcc.std...Y           : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
##  $ fBodyAcc.std...Z           : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
##  $ fBodyAccJerk.mean...X      : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
##  $ fBodyAccJerk.mean...Y      : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
##  $ fBodyAccJerk.mean...Z      : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
##  $ fBodyAccJerk.std...X       : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
##  $ fBodyAccJerk.std...Y       : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
##  $ fBodyAccJerk.std...Z       : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
##  $ fBodyGyro.mean...X         : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
##  $ fBodyGyro.mean...Y         : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
##  $ fBodyGyro.mean...Z         : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
##  $ fBodyGyro.std...X          : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
##  $ fBodyGyro.std...Y          : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
##  $ fBodyGyro.std...Z          : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
##  $ fBodyAccMag.mean..         : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
##  $ fBodyAccMag.std..          : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
##  $ fBodyBodyAccJerkMag.mean.. : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
##  $ fBodyBodyAccJerkMag.std..  : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
##  $ fBodyBodyGyroMag.mean..    : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
##  $ fBodyBodyGyroMag.std..     : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
##  $ fBodyBodyGyroJerkMag.mean..: num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyBodyGyroJerkMag.std.. : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
```

