#/bin/bash
if [ "$1" ] && [ ${1} != "" ]
then
  echo -e "module $1.index where\n" > src/${1}/index.agda
fi
for i in $( find src/${1} -name "*.agda" | grep -v "index.agda" | sed 's|src/\(.*\)\.agda|\1|' | sed 's|/|.|g' | sort ); do
  echo "import $i" >> src/${1}/index.agda;
done
