#!/bin/sh

pname=acg1
bucket=acg1-bucket
instance=acg-vm

# Create project
gcloud projects create $pname
gcloud config set project $pname
gcloud config set zone us-west2-a

# Create bucket
gcloud storage buckets create gs://$bucket


# create vm
gcloud compute instances create $instance --machine-type=f1-micro --metadata=startup-script-url=:s://raw.githubusercontent.com/ACloudGuru/gcp-cloud-engineer/master/compute-labs/worker-startup-script.sh --metadata=lab-logs-bucket=gs://bucket
# vm service scope

# start vm
gcloud compute instances start $instance
