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

### subfolders and label orders
The label orders are generated from the Schaefer 400 parcellation. They might either follow the [Yeo 17 network ordering](https://github.com/ThomasYeoLab/CBIG/blob/master/stable_projects/brain_parcellation/Schaefer2018_LocalGlobal/Parcellations/MNI/freeview_lut/Schaefer2018_400Parcels_17Networks_order.txt) or [Yeo 7 network ordering](https://github.com/ThomasYeoLab/CBIG/blob/master/stable_projects/brain_parcellation/Schaefer2018_LocalGlobal/Parcellations/MNI/freeview_lut/Schaefer2018_400Parcels_7Networks_order.txt).
For visualization purposes, you might wish to reorder the matrices (you can find the instructions on how to do so in the subsection below).

1. `t1` - Metrics of cortical thickness, area and volume of each parcel of the Schaefer 400 parcellations.

		a. features_ct: cortical thickness - follows Yeo 17 network ordering
		b. features_ca: cortical thickness - follows Yeo 17 network ordering
		c. features_cv: cortical thickness - follows Yeo 17 network ordering

2. `tbss` - Vectorized TBSS skeleton of each subject containing FA, MD, AD, RD, OD, ICVF and ISOVF metrics.

		a. features_tbss_FA: fractional anisotropy - generated from TBSS skeleton
		b. features_tbss_MD: mean diffusivity - generated from TBSS skeleton
		c. features_tbss_AD: axial diffusivity - generated from TBSS skeleton
		d. features_tbss_RD: radial diffusivity - generated from TBSS skeleton
		e. features_tbss_OD: orientation dispersion - generated from TBSS skeleton
		f. features_tbss_ICVF: intracellular volume fraction - generated from TBSS skeleton
		g. features_tbss_ISOVF: isotropic volume fraction - generated from TBSS skeleton

3. `tractography` - Lower triangle of the 400x400 structural connectivity matrix of each subject containing stream count (log transformed), stream length, FA, MD, AD, RD, OD, ICVF and ISOVF metrics.

		a. features_schaefer_FA: fractional anisotropy - follows Yeo 17 network ordering
		b. features_schaefer_MD: mean diffusivity - follows Yeo 17 network ordering
		c. features_schaefer_AD: axial diffusivity - follows Yeo 17 network ordering
		d. features_schaefer_RD: radial diffusivity - follows Yeo 17 network ordering
		e. features_schaefer_OD: orientation dispersion - follows Yeo 17 network ordering
		f. features_schaefer_ICVF: intracellular volume fraction - follows Yeo 17 network ordering
		g. features_schaefer_ISOVF: isotropic volume fraction - follows Yeo 17 network ordering
		h. features_schaefer_streamcount_log: log transformed stream count - follows Yeo 17 network ordering
		i. features_schaefer_streamlen: stream length - follows Yeo 17 network ordering

4. `fmri` - Lower triangle of the 400x400 functional connectivity matrix, calculated with Pearson's correlation. Contains matrices generated from resting state fMRI, working memory, social, gambling, language and motor task fMRI. 

		a. features_rs: resting state fMRI - follows Yeo 17 network ordering
		b. features_wm: working memory task fMRI - follows Yeo 7 network ordering
		c. features_language: language task fMRI - follows Yeo 7 network ordering
		e. features_social: social task fMRI - follows Yeo 7 network ordering
		f. features_gamb: gambling task fMRI - follows Yeo 7 network ordering
		g. features_motor: motor task fMRI - follows Yeo 7 network ordering

### Reshaping tractography and fMRI files into the original connectivity matrix
Tractography and fmri files are saved in a 79,800x753 mat file, which corresponds to #edges in lower triangle of FC matrix x #participants. 
The lower triangle was extracted column-wise from the FC matrix and concatenated into a single vector. The vectorized lower triangle of each subject can be reshaped to the full 400x400 FC matrix by submitting it to this function in our main repository: [CBIG_FC_vector2mat.m](https://github.com/ThomasYeoLab/CBIG/tree/master/utilities/matlab/FC/CBIG_FC_vector2mat.m).

### Changing between different network orders
For visualization in the paper, label orders have been reordered to the [Kong2022 17 network ordering](https://github.com/ThomasYeoLab/CBIG/blob/master/stable_projects/brain_parcellation/Schaefer2018_LocalGlobal/Parcellations/MNI/freeview_lut/Schaefer2018_400Parcels_Kong2022_17Networks_order.txt). 
To reorder the indices between versions, first convert the vectorized lower triangle into the full matrix. 
You may use the function [CBIG_ReorderParcelIndex.m](https://github.com/ThomasYeoLab/CBIG/blob/master/utilities/matlab/FC/CBIG_ReorderParcelIndex.m) with the corresponding [annot files](https://github.com/ThomasYeoLab/CBIG/tree/master/stable_projects/brain_parcellation/Schaefer2018_LocalGlobal/Parcellations/FreeSurfer5.3/fsaverage/label) of the network orders you want to swap between. This function will give the indices corresponding between the new and old ordering.
The matrix can be reordered with the indices, e.g. `new_FC_mat = old_FC_mat(new_index, new_index)`.

