#!/bin/sh
#####
# This function is to unzip each tar file into the full features file. Tar files have been created with a maximum
# size of 40MB for storage in github. The command used to split the full mat file into the tar files is:
# tar cvzf - features_*.mat | split --bytes=40MB - features_*.tar.gz.
# This function iterates through all fmri and diffusion features to unpack them. Remove them from feature_array
# if you dont wish to unpack them.
#
# Written by Leon Ooi and CBIG under MIT license: https://github.com/ThomasYeoLab/CBIG/blob/master/LICENSE.md
#####

# list of features to unpack
feature_arr=("fmri/features_rs" "fmri/features_wm" "fmri/features_lang" "fmri/features_gamb" \
	"fmri/features_social" "fmri/features_motor" "tbss/features_tbss_FA" \
	"tbss/features_tbss_MD" "tbss/features_tbss_AD" "tbss/features_tbss_RD" \ 
	"tbss/features_tbss_OD" "tbss/features_tbss_ICVF" "tbss/features_tbss_ISOVF" \
	"tractography/features_schaefer_streamcount_log" "tractography/features_schaefer_streamlen" \
	"tractography/features_schaefer_FA" "tractography/features_schaefer_MD" \ 
	"tractography/features_schaefer_AD" "tractography/features_schaefer_RD" \
	"tractography/features_schaefer_OD" "tractography/features_schaefer_ISOVF" \
	"tractography/features_schaefer_ICVF" "tractography/features_schaefer_streamcount_log")

# loop over features
for feature in ${feature_arr[@]}; do
	feature_dir=${feature}_split
	if [ -d $feature_dir ]; then
		echo "Unpacking : $feature" 
		featurebase=$(basename $feature)
		# untar
		cd $feature_dir
		cat $featurebase.tar.gz.* | tar xzvf -
		# move to upper directory
		mv $featurebase.mat ..\
		# return to original directory
		cd ../..
	fi
done