## About

Here we run REML-based regulability using two implementations: `gcta` and `hail`.

1. First, we run `run_format.screen` which performs formatting; 
2. Then, we run `run_gcta.screen` which runs `gcta` based approach;
3. In parallel to 2, we run `run_hail.screen` which runs `hail` based approach.

## Example run

For a given individual list, set it up.

```
POPNAME='British-test-1'  
OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability
GENEMODEL=ctimp_Whole_Blood
```

Do formatting first.

```
screen -dmS format-$POPNAME bash run_format.screen $POPNAME $GENEMODEL $OUTDIR
```

Then, do gcta

```
screen -dmS format-$POPNAME bash run_gcta.screen $POPNAME $GENEMODEL $OUTDIR
```

## Loop over all lists

Formatting.

```
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS format-$i bash run_format.screen $i $GENEMODEL $OUTDIR
done
```

Run `gcta`

```
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS gcta-$i bash run_gcta.screen $i $GENEMODEL $OUTDIR
done
```

Run `hail`

```
mylist=('African' 'Indian')
GENEMODEL=ctimp_Whole_Blood
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$GENEMODEL bash run_hail.screen $i $GENEMODEL $OUTDIR
done
```

To run one population for many models, do (formatting as an example)

```
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
modellist='path_to_list_here'
for i in "${mylist[@]}"
do 
  screen -dmS format-batch-$i bash batch_run_format.screen $i $modellist $OUTDIR
done
```

or do hail GCTA

```
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
modellist='path_to_list_here'
for i in "${mylist[@]}"
do
  screen -dmS hail-batch-$i bash batch_run_hail.screen $i $modellist $OUTDIR
done
```

Run `hail` with multiple tissues (`naive` mode or `tissue_svd` mode)

```
CONFIGNAME=ctimp_top10
OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability
MODE=naive  # or tissue_svd
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$CONFIGNAME bash run_hail_multi.screen $i $CONFIGNAME $OUTDIR $MODE
done
```

Run `hail` with multiple tissues (train EVD by gene, `tissue_svd_train` mode)

```
CONFIGNAME=ctimp_top10
OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability
MODE=tissue_svd_train
POP='British-test-1'
screen -dmS hail-$POP-$CONFIGNAME bash run_hail_multi.screen $POP $CONFIGNAME $OUTDIR $MODE
```


Run `hail` with a pre-specified gene list

```
# GENEMODEL=CAU or AFHI
# OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/common_gene to avoid overwrite
# GENELIST=/vol/bmd/yanyul/GitHub/ptrs-ukb/misc/common_genes_in_mesa_cau_and_afhi.txt
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$GENEMODEL bash run_hail_w_gene_list.screen $i $GENEMODEL $OUTDIR
done
```

Run `hail` with new split
```
# GENEMODEL=CAU or AFHI
# OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/common_gene_new_split to avoid overwrite
# GENELIST=/vol/bmd/yanyul/GitHub/ptrs-ukb/misc/common_genes_in_mesa_cau_and_afhi.txt
# CONFIG=config.new_split.yaml
i=African
screen -dmS hail-$i-$GENEMODEL bash run_hail_w_gene_list.screen $i $GENEMODEL $OUTDIR $GENELIST $CONFIG
```

Run `hail` with CarAfr
```
# GENEMODEL=CAU or AFHI
# OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/common_gene_new_split to avoid overwrite
# GENELIST=/vol/bmd/yanyul/GitHub/ptrs-ukb/misc/common_genes_in_mesa_cau_and_afhi.txt
# CONFIG=config.carafr.yaml
i=CarAfr
screen -dmS hail-$i-$GENEMODEL bash run_hail_w_gene_list.screen $i $GENEMODEL $OUTDIR $GENELIST $CONFIG
```

Run `hail` with new2 split
```
# GENEMODEL=CAU or AFHI
# OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/common_gene_new2_split to avoid overwrite
# GENELIST=/vol/bmd/yanyul/GitHub/ptrs-ukb/misc/common_genes_in_mesa_cau_and_afhi.txt
# CONFIG=config.new2_split.yaml
i=Caribbean
screen -dmS hail-$i-$GENEMODEL bash run_hail_w_gene_list.screen $i $GENEMODEL $OUTDIR $GENELIST $CONFIG

# GENEMODEL=ctimp_gtex_v8
# i=Caribbean or Indian
# CONFIG=config.new2_split.yaml
# OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/common_gene_new2_split to avoid overwrite
screen -dmS hail-$i-$GENEMODEL bash run_hail.screen $i $GENEMODEL $OUTDIR $CONFIG
```

Run MESA ALL with new split
```
mylist=('African' 'British-test-1' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$GENEMODEL bash run_hail.screen $i $GENEMODEL $OUTDIR
done
```


Run `hail` with multiple tissues (`naive` mode or `tissue_svd` mode)

```
CONFIGNAME=ctimp_top10_update
OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/revision
MODE=tissue_svd_train
mylist=('African' 'Indian' 'Chinese')
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$CONFIGNAME bash run_hail_multi.screen $i $CONFIGNAME $OUTDIR $MODE
done
```


Run `hail`

```
mylist=('African' 'Indian')
OUTDIR=/vol/bmd/yanyul/UKB/gcta_regulability/revision
GENEMODEL=ctimp_Whole_Blood
CONFIGFILE=config.new_split.yaml
for i in "${mylist[@]}"
do 
  screen -dmS hail-$i-$GENEMODEL bash run_hail.screen $i $GENEMODEL $OUTDIR $CONFIGFILE
done
```
