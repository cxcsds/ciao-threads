#!/bin/sh 



notebook_dir=/data/sdsreg/thread_output/Notebooks/
dest_dir=/data/sdsreg/current_regtest/threads_tests/threads/
grp=ciaotest


copy_bash_notebook()
{
    
  nb=$1
  
  to=`basename $nb | sed 's,\.sh$,.MAIN,g'`
  
  cat $nb | \
    egrep -v '^source /export' | \
    sed 's,^display,#display,g' | \
    sed 's,^##REGRESSION_TEST: ,,g' | \
    cat > $dest_dir/$to
  chgrp $grp $dest_dir/$to
  chmod 775 $dest_dir/$to

  echo $to
  
}


for nn in `/bin/ls ${notebook_dir}/*sh | grep -v build_main_from `
do
  copy_bash_notebook $nn
done

