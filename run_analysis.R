half_df <- function(act,feat_ind,feat_lab,type){
  
# Getting subject ID
ID <- read.table(sprintf("UCI HAR Dataset/%s/subject_%s.txt",type,type))
names(ID) <- "subject.ID"

# Getting set specific activities labels
df_activities <- read.table(sprintf("Data//UCI HAR Dataset//%s//y_%s.txt",type,type))
df_activities[df_activities==1] <- as.character(act[1,2])
df_activities[df_activities==2] <- as.character(act[2,2])
df_activities[df_activities==3] <- as.character(act[3,2])
df_activities[df_activities==4] <- as.character(act[4,2])
df_activities[df_activities==5] <- as.character(act[5,2])
df_activities[df_activities==6] <- as.character(act[6,2])
names(df_activities) <- "activities.Label"

# Reading data
df <- read.table(sprintf("UCI HAR Dataset/%s/X_%s.txt",type,type))

#Getting features based on mean and standard deviation
df_mean_std <- df[,feat_ind]
names(df_mean_std) <- feat_lab

# Binding all data together in one tidy data frame with subject ID, activities label, Training type, and all features of interest
full_df <- cbind(ID,df_activities$activities.Label)
names(full_df) <- c("ID","Activity")
full_df$Training_Type = type
full_df <- cbind(full_df,df_mean_std)
}

# Getting activities labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("activities.ID","activities.Label")

# Getting features of interest
features <- read.table("UCI HAR Dataset/features.txt")
features_indices <- grep("mean[:(:][:):]|std[:(:][:):]",features[,2])
features_labels <- features[features_indices,2]

# Calling the function for test and training set, and binding them together
test_df <- half_df(activities,features_indices,features_labels,"test")
train_df <- half_df(activities,features_indices,features_labels,"train")
final_df <- rbind(train_df,test_df)