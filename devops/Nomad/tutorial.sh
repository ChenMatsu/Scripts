#!/bin/bash

# Clone tutorial repository.
git clone https://github.com/hashicorp-education/learn-nomad-getting-started
cd learn-nomad-getting-started
git checkout -b nomad-getting-started v1.1

# Leave Nomad running in this terminal session.
# The -bind flag set to 0.0.0.0 instructs Nomad to listen on all network interfaces present on the machine.
# The -network-interface flag instructs Nomad to use a network interface other than the default loopback interface (localhost)
sudo nomad agent -dev \
  -bind 0.0.0.0 \
  -network-interface='{{ GetDefaultInterfaces | attr "name" }}'

# Export the cluster address.
export NOMAD_ADDR=http://localhost:4646

# Run the Nomad job.
nomad job run pytechco-redis.nomad.hcl
nomad job run pytechco-web.nomad.hcl

# Get the IP address of the webapp. 
# The following command gets the allocation ID of the web job and uses that ID to get the status of the allocation.
# It then searches for the IP address in the allocation status output and formats the IP address into a link with the webapp's port.
# Open the URL from the output in your browser to see the webapp frontend.

nomad node status -verbose \
    $(nomad job allocs pytechco-web | grep -i running | awk '{print $2}') | \
    grep -i ip-address | awk -F "=" '{print $2}' | xargs | \
    awk '{print "http://"$1":5000"}'

nomad job run pytechco-setup.nomad.hcl
nomad job dispatch -meta budget="200" pytechco-setup
nomad job run pytechco-employee.nomad.hcl

nomad job stop -purge pytechco-employee

nomad job dispatch -meta budget="500" pytechco-setup
nomad job run pytechco-employee.nomad.hcl

nomad job stop -purge pytechco-employee

nomad job stop -purge pytechco-web
nomad job stop -purge pytechco-redis