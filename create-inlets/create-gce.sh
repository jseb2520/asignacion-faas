#!/usr/bin/env bash
#
# Script to create inlet exit node in GCE
#
# NOTE:  GCP project must be created and marked as current project on gcloud CLI before running this script.
#
# CREATED BY: Johan Sebastián Hernández
#

# Get current projectID
export PROJECTID=$(gcloud config get-value core/project 2>/dev/null)

# Create a service account
gcloud iam service-accounts create inlets \
--description "inlets-operator service account" \
--display-name "inlets"

# Get service account email
export SERVICEACCOUNT=$(gcloud iam service-accounts list | grep inlets | awk '{print $2}')

# Assign appropriate roles to inlets service account
gcloud projects add-iam-policy-binding $PROJECTID \
--member serviceAccount:$SERVICEACCOUNT \
--role roles/compute.admin

gcloud projects add-iam-policy-binding $PROJECTID \
--member serviceAccount:$SERVICEACCOUNT \
--role roles/iam.serviceAccountUser

# Create inlets service account key file
gcloud iam service-accounts keys create key.json \
--iam-account $SERVICEACCOUNT

# Create a tunnel with inlets OSS
inletsctl create -p gce --project-id=$PROJECTID -f key.json --zone=us-east1-c