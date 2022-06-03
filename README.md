# Comparison of individualized behavioral predictions across anatomical, diffusion and functional connectivity MRI (MMP)
This repository contains the data release for the **HCP** data used in the following study.
## REFERENCE
* Ooi, L.Q.R., Chen, J., Zhang, S., Tam, A., Li, J., Dhamala, E., Zhou, J.H., Holmes, A.J., Yeo, B.T., 2022. Comparison of individualized behavioral predictions across anatomical, diffusion and functional connectivity MRI. BioRxiv. [doi: 10.1101/2022.03.08.483564](https://doi.org/10.1101/2022.03.08.483564)

## BACKGROUND
We extracted features derived from anatomical T1, diffusion and functional imaging, and compared their ability in predicting behaviour at an individual level using the HCP and ABCD using 3 regression models. We found that functional MRI gave the best prediction results, regardless of type of regression or behaviour. The combination of these modaliteis through stacking improved predictions of cognition, but not other aspects of behaviour. Additionally, combing features of functional MRI performs as well as combining all features from all modalities. 

## Data release
This repository contains input data and results from our study for the HCP dataset. The main repository for the codes used in this project can be found here: [Standalone_Ooi2022_MMP](https://github.com/ThomasYeoLab/Standalone_Ooi2022_MMP). One may either 
1. Replicate the study by running the regression code wrappers found in the main repository using the features and training-test splits provided in this repository.
2. Make comparisons to the benchmarks provided in the paper by utilizing the same set of subjects and training-test splits to compare your own algorithm to the results achieved in this paper.

This repository is arranged into the following folders:
### data
This folder contains data required to run regressions to perform individualized predictions of behaviour. Please see the README in the folder for more details.
Please note that in addition to the data provided in this repository, you will need to access additional restricted data from the HCP [(log in here)](https://db.humanconnectome.org/):
1. Age
2. Family ID
3. Behavior scores (a list of the 58 behaviour scores we use in this project is available under `data/behaviors`)

### splits
This folder contains a mat file showing the assignment of subjects into training and test sets for the 60 random initializations of 10 fold-cross validation procedure used in our paper. Test subjects are indicated as 1 and training subjects are indicated as 0.

### results
This folder contains results of behavior prediction from each random initialization. They are saved in a 3D matrix of form #behaviours x #splits x #models. See the README in the folder for more information.

# UPDATES
- Release v0.0.1 (28/2/2022): Initial release of HCP repository for Ooi2022_MMP project
- Update v0.0.2 (6/3/2022): Update component scores with clean version (not estimated from subjects used in prediction)

# BUGS and QUESTIONS
Please contact Leon Ooi at leonooiqr@gmail.com and Thomas Yeo at yeoyeo02@gmail.com.
