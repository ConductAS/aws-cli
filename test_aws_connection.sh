#!/bin/bash

function test_aws_connection {
	cmd=$EC2_HOME/bin/ec2-describe-images
	if [[ -e $cmd ]]; then
		echo "Testing connection..."
		if [[ `$cmd -o amazon` ]]; then
			echo "Connection OK"
			return 0
		else
			echo "ERROR: Connection failed"
			return -1
		fi
	else
		echo "ERROR: $cmd not found"
		return -1;
	fi
}

echo "AWS account: $ACTIVE_AWS_ACCOUNT"
test_aws_connection