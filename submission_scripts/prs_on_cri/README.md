Calculate PRS on CRI.

1. The genotype is pre-extracted at `../subset_bgen/run_subset_bgen_prs_all.qsub`
2. Prepare PRS weight table `prep_prs_weights.qsub`.
3. Calculate PRS using `plink2` `submit_prs.sh` per chromosome per trait per cutoff.
4. Merge results in step 3 into one table.

 