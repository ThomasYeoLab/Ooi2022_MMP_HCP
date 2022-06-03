# Data
This folder holds the input data required for running the regressions for performing individualized behaviour predictions. There are 2 subfolders here.

## behaviours
The contents of this folder include:
1. `MMP_HCP_componentscores.csv`: A csv file containing the component scores summarizing the original 58 behaviors used in the study. Please note that age, family ID and the original 58 behavior scores are not included here as it requires restricted access to the HCP, which can be accessed online [(log in here)](https://db.humanconnectome.org/). Once you have downloaded them, merge the values into this csv.
2. `MMP_HCP_753_subs.txt`: A txt file containing a list of subject IDs used in this study for the prediction analysis. 
3. `MMP_HCP_80_subs_componentscoreestimation.txt`: A txt file containing a list of subject IDs used to estimate the component scores. 
4. `MMP_HCP_y_variables.txt`: A txt file containing the variable names of the 58 original behaviours and 3 component scores used for analysis. 
5. `MMP_HCP_covariates.txt`: A txt file containing the variable names of covariates from the  used for analysis. 
6. `MMP_HCP_factor_loadings.mat`: A mat file containing the factor loadings for the 3 factor scores. It additionally includes the mean and standard deviation used to normalize each behaviour score.

## features
The contents of this folder include 4 subfolders. Each subfolder contains feature matrices from each modality arranged in the form of #features x #subjects. Due to size limitations on github, the files are zipped using `tar`. To unzip the folders run `./features/CBIG_MMP_unpack_splitfiles.sh`. This assumes all features are zipped into tar files of max size 40MB in a folder `<feature_name>_split`.
1. `t1` - Metrics of cortical thickness, area and volume of each parcel of the Schaefer 400 parcellations 
2. `tbss` - Vectorized TBSS skeleton of each subject containing FA, MD, AD, RD, OD, ICVF and ISOVF metrics.
3. `tractography` - Lower triangle of the 400x400 structural connectivity matrix of each subject containing stream count (log transformed), stream length, FA, MD, AD, RD, OD, ICVF and ISOVF metrics.
4. `fmri` - Lower triangle of the 400x400 functional connectivity matrix, calculated with Pearson's correlation. Contains matrices generated from resting state fMRI, working memory, social, gambling, language and motor task fMRI. 
