# Splits
This folder contains the training-test splits used for each random initialization of the prediction workflow. Opening `MMP_HCP_60_splits.mat` will give the following struct:

```
|-folds
  |-seed_1
    |-sub_fold
      |-subject_list
      |-fold_idx
  |-seed_2
    |-sub_fold
      |-subject_list
      |-fold_idx
.
.
.
  |-seed_60
    |-sub_fold
      |-subject_list
      |-fold_idx
```

There are 60 random initializations of the 10 fold-cross validation splits. Each random initialization is named as `seed_<number>`. Under each `seed_<number>` there is a 1x10 cell which contains 2 fields: `subject_list` and `fold_index`.
`subject_list`: A list of subject numbers for each test fold.
`fold_index`: Logical array of training and test subjects. Training subjects are marked as 0 while test subjects are marked as 1.
