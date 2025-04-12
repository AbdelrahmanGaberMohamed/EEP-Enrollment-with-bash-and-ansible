#!/bin/bash
#Bash script for reconfiguring elastic-agent 
#Exit Codes:
#	0: Success

								
#Install the ca.crt of the new environment in the trusted CAs
yum install -y ca-certificates
update-ca-trust force-enable
cp /root/elastic-ca.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
#Install and configure elastic agent
mkdir /opt/fleet/
cd /opt/fleet/
cp /root/elastic-agent-8.11.2-linux-x86_64.tar.gz .
tar xzvf elastic-agent-8.11.2-linux-x86_64.tar.gz
cd /opt/fleet/elastic-agent-8.11.2-linux-x86_64/ 
cp /root/ca.crt /opt/fleet/elastic-agent-8.11.2-linux-x86_64/.
cp /root/modon-elastic-1.crt /opt/fleet/elastic-agent-8.11.2-linux-x86_64/.

./elastic-agent install -f --url= https://elastic-master:8220\
--enrollment-token=ekZFVE1JMEJEbEFycl9NSVU0RDA6Z293MVhVYnFSU1cyVWJtbTRBUXRJZw==

exit 0 
