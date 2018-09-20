#!/bin/env bash

RH_BASED=false
MAJOR_VERSION=0

# Tests if there is an /etc/redhat-release file.
# This applies to distributions based on Redhat, also.
if [ -f /etc/redhat-release ]
then
  RH_BASED=true
fi

if [[ $RH_BASED == true ]]
then
  # Handle it this way because different distributions have different numbers of spaces,
  # So using whitespace as delimiters won't work.
  # WARNING: This will blow up if there is a '.' in the file prior to the version number.
  MAJOR_VERSION=`awk 'BEGIN { FS = "." }; {print $1}' /etc/redhat-release | awk '{print $NF}'`
fi

if [[ $MAJOR_VERSION -ge 6 && $MAJOR_VERSION -lt 7 ]]
then
  echo "Do version 6 things."
elif [[ $MAJOR_VERSION -ge 7 && $MAJOR_VERSION -lt 8 ]]
then
  echo "Do version 7 things."
else
  echo "Unhandled version $MAJOR_VERSION."
fi
