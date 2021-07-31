#!/bin/sh

#remove the outputs.json file if present
rm -f outputs.json
# base url for getting instance metadata
export metaurl="http://169.254.169.254/latest/meta-data/"
#all the available categories of instance metadata is being written to a file
curl -s $metaurl > parameter.txt
#all the available categories of instance metadata is being stored as arrays
export lines=$(curl -s $metaurl)
echo "Below are the available categories of instance metadata from within a running instance"
cat parameter.txt
echo ""
touch outputs.json
echo "{}">>outputs.json
echo "Below are the values of instance metadata of an instance"
for val in $lines
do
#generating the fully qualified url to get an indiviual metadata
fullurl=$metaurl$val
echo $fullurl
response=$(curl -s $fullurl);
echo $response
#storing the response in json format and doing cleanup using sed command
temp=$(jq --arg key "$val" --arg values "$response" '.key = $values' outputs.json)
echo $temp > outputs.json
sed -i "s@key@$val@" outputs.json
sed -i "s@/"@"@g" outputs.json
done
echo ""
echo "Below is the output of instance metadata in JSON format and it is available in outputs.json"
#printng the output in readable json format
cat outputs.json | jq '.'
