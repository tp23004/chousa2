#!/bin/bash

CC="gcc -Wall" 
PYTHON=python3

for l in c python; do # cとpythonに対してループする
    if [ $l == "c" ]; then # cの場合
        ext="c"
        cmd="$CC"
        fn="build"
    else # pythonの場合
        ext="py"
        cmd="$PYTHON"
        fn="run"
    fi
    for i in 1_saiki 1_matsubi 2_saiki 2_matsubi 4_saiki; do
        dir=$l/p$i # ディレクトリパスの作成
        mkdir -p $dir
        pushd $dir >/dev/null #ディレクトリに移動
        touch p.$ext $fn
        chmod a+rx $fn
        
        # buildに出力する
        echo "git add p.$ext" >> $fn
        echo "git commit --quiet --allow-empty" >> $fn
        echo "$cmd p.$ext" >> $fn

        git init --quiet --initial-branch=main
        git config user.name "souto"
        git config user.email "tp23004-4313@sti.chubu.ac.jp"
        popd >/dev/null
    done
done
echo "done."

