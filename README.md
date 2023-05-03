#!/usr/bin/ansible-playbook
---
 - name: showing variables
   hosts: praveen
   vars: 
     os: "linux"
     cloud: "aws"
     tools: "devops"
   tasks:
     - debug: msg="We will provide {{os}}"
     - debug: msg="and lab experiance in {{cloud}}"
     - debug: msg="basic knowledge in {{tools}}"
...
