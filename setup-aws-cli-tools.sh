#!/bin/bash

AWS_CLI_URL=http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
RDS_CLI_URL=http://s3.amazonaws.com/rds-downloads/RDSCli.zip

echo "Creating directories..."
mkdir tmp bin lib

cd tmp

echo "Fetching EC2 API tools..."
wget $AWS_CLI_URL

echo "Fetching RDS API tools..."
wget $RDS_CLI_URL

echo "Unzipping tools..."
for f in *.zip ; do unzip $f; done

for d in * ; do 
	if [[ -d $d ]]; then
		echo "Copy bin and lib from: " $d
		cp -r $d/bin/* ../bin
		cp -r $d/lib/* ../lib
	fi
done

echo "Setting execute permissions..."
cd ..
chmod -R u+rxw bin/*

echo
echo "Installation finished. You can now remove tmp/."
 