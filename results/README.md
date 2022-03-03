# Results
This folder contains results from the paper from each split. They are saved in a 3D matrix of form #behaviours x #splits x #models, where the number of splits is 60 (Results from the 10 fold-cross validation from each split were averaged). 
* Single-feature results: Results in order of {'Cognition', 'Dissatisfaction', 'Emotional Rec' 'Avg'}, where the first 3 refer to component scores and the last score is the average over the 58 original behavioral scores. The order of models for each modality is as follows.
1. t1: {'features_ct' 'features_ca' 'features_cv'}
2. tbss: {'features_tbss_FA' 'features_tbss_MD' 'features_tbss_AD' 'features_tbss_RD' 'features_tbss_OD' 'features_tbss_ICVF' 'features_tbss_ISOVF'};
3. tractography: {'features_schaefer_FA' 'features_schaefer_MD' ...
    'features_schaefer_AD' 'features_schaefer_RD' 'features_schaefer_OD' ...
    'features_schaefer_ICVF' 'features_schaefer_ISOVF' ...
    'features_schaefer_streamcount_log' 'features_schaefer_streamlen' };
4. fmri: {'features_rs' 'features_social' 'features_gamb' 'features_lang' 'features_wm' 'features_motor'}
* Combined model results: Results in order of {'Cognition', 'Dissatisfaction', 'Emotional Rec'}. Features are in order of {'best' 'multiKRR_k1_rs_k2_wm_k3_lang_k4_gamb_k5_social_k6_motor' 'stacking_LRR_rs_wm_lang_gamb_social_motor' 'stacking_LRR_all'}, where best refers to the best performing single feature modality for the behaviour score in question.
