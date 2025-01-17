Run example:

```
$ screen -dmS gwas_up bash run_all_chrs.sh up middle bottom
```

Others are test scripts. 
Current setup run on 6 inner lists at a time. 
There were errors on memory when injecting 17 lists all at once. 
See this [thread](https://hail.zulipchat.com/#narrow/stream/128581-Cloud-support/topic/getting.20Index.20reader.20cache.20hit.20rate.20message/near/183652217) for more information.

 For more information on the computing resource setup for UKB data, see this [thread](https://hail.zulipchat.com/#narrow/stream/128581-Cloud-support/topic/cluster.20config.20for.20UKB.20GWAS/near/179199054).
 
Regarding the subsets and phenotype table, I archived the one uploaded to GCP in `nucleus`: `/vol/bmd/yanyul/UKB/output-archived-for-ukb-run-on-121719.tar.gz` for a backup copy.

**Post-formatting** is done on washington.

```
$ screen -dmS convert bash post_run_formatting.screen
```
