Getting-and-Cleaning-Data Course project
=========================


### run_analysis.R

The script works with one function to which it is necessary to provide the argument `type` as it will then look for the test or training dataset accordingly.

Ahead of the function call, this script processes the information that is common for both dataset, i.e. the activity labels and the features indices and labels.

It will then feed the function with these 4 arguments : the type of the dataset, the features indices, features labels and activities labels.

The function itself will look for the different files and bind them together in a tidy dataset. It will first store the subject IDs in a vector, and then the activities labels in an other vector. By using the features indices and features labels vectors fed as arguments, it will then create a dataset with only the features of interest.

Finally, it will bind all of this together and using the `type` of the dataset which has been input (train or test), it will create a column `$type` to be able to distinguish them.

Ultimately, after the function calles for both types, it will stack them on top of each other so that we end up with a dataset merging training and test data together, with only the features we're interested in and the activities and the features labeled properly using the different files provided.