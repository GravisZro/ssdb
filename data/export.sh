#!/bin/sh

datafile="SSDB_Raw_Data.xlsx"
nameroot=$(basename $datafile .xlsx)

soffice --convert-to csv:"Text - txt - csv (StarCalc)":44,39,UTF8,1,,0,true,true,false,false,false,-1 $datafile
rm $nameroot-INTRO.csv
rm headers.json

for csv in $(basename $datafile .xlsx)-*.csv
do
  sheetname=$(basename $csv .csv | cut -d '-' -f 2 | sed -e 's/[A-Z]/\L&/g')
  json=$sheetname.json

  #convert to CSV to almost JSON
  cat $csv | sed \
    -e "s/,,/,'',/g" \
    -e "s/,,/,'',/g" \
    -e "s/^,/,''/" \
    -e "s/,$/,''/" \
    -e "s/^/{ /" \
    -e "s/$/ },/" >> $json.raw

  #extract header line
  cat $json.raw | head -n 1 >> headers.json

  echo "{" > $json
  cat $json.raw | tail -n +2 >> $json
  echo "}" >> $json

  rm $csv $json.raw
done
