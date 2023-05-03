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
#!/usr/bin/ansible-playbook
---
 - name: checking kernel version
   hosts: praveen
   tasks:
     - name: kernel info
       command: uname -a
...
#!/usr/bin/ansible-playbook
---
 - name: kernel version
   hosts: praveen
   tasks:
    - name: server kernel
      command: uname -a
      register: kernel
    - debug: var=kernel
...
#!/usr/bin/ansible-playbook	
---
 - name: kernel
   hosts: praveen
   tasks:
     - name: server kernel
       command: uname -a
       register: kernel
     - debug: var=kernel.stdout
...
#!/usr/bin/ansible-playbook
---
 - name: Checking kernel version
   hosts: praveen
   tasks:
    - name: server kernel
      command: uname -a
      register: kernel
    - debug: var=kernel.stdout
    - name: server date
      command: date
      register: date
    - debug: var=date.stdout
    - name: server time
      command: uptime
      register: up
    - debug: var=uptime.stdout
    - name: server hostname
      command: hostname
      register: name
    - debug: var=hostname.stdout
...
#!/usr/bin/ansible-playbook
---
 - name: Checking kernel version
   hosts: praveen
   tasks:
    - name: server kernel
      command: uname -a
      register: kernel
    - debug: var=kernel.stdout
      tags: ker
    - name: server date
      command: date
      register: date
    - debug: var=date.stdout
      tags: time
    - name: server time
      command: uptime
      register: up
    - debug: var=uptime
      tags: load
    - name: server hostname
      command: hostname
      register: name
    - debug: var=hostname
      tags: name
...
#!/usr/bin/ansible-playbook
---
 - name: This is line
   hosts: praveen
   tasks:
     - debug: msg="welcome to b22" 
...
#!/usr/bin/ansible-playbook
---
 - name: This is line2
   hosts: praveen
   tasks:
    - debug:
        msg: "welcome to india"
...
#!/usr/bin/ansible-playbook
---
 - name: This is 3rd case
   hosts: praveen
   tasks:
     - name: display the below message
       debug:
         msg:
          - "Welcome to Hyd"
          - "Welcome to Varains"
          - "Welcome to hostel kondapur"
...
#!/usr/bin/ansible-playbook
---
 - name: This is 4th pb
   hosts: praveen
   tasks:
    - name: print
      debug:
        msg: "The hostname is :{{inventory_hostname}}"
...
#!/usr/bin/ansible-playbook
---
 - name: This is 5 playbook
   hosts: praveen
   tasks:
    - name: printing
      debug:
        var: inventory_hostname
...
#!/usr/bin/ansible-playbook
---
 - name: This is 6th module
   hosts: praveen
   tasks:
    - name: Print IP Address
      debug:
#        msg: "MY Ip Address of servers :{{ansible_default_ipv4.address}}"
         var: ansible_default_ipv4.address
...
#!/usr/bin/ansible-playbook
---
 - name: Facts Display
   hosts: praveen
   tasks:
    - name: Display all Facts
      debug:
        msg: 
          - "My hostname is {{ansible_hostname}}"
          - "My IP Adress is {{ansible_default_ipv4.address}}"
          - "My address is {{ansible_facts['fqdn']}}"
...
#!/usr/bin/ansible-playbook
---
 - name: usage of Verbosity
   hosts: praveen
   tasks:
     - name: Printing IP Address
       debug:
         msg: "My IP Address of server is :{{ansible_default_ipv4.address}}"
         verbosity: 0
...
#!/usr/bin/ansible-playbook
---
 - name: showming Variables
   hosts: praveen
   vars:
     os: "linux"
     cloud: "aws"
     tools: "devops"
   tasks:
     - name: Debug message
       debug:
         msg: "I LOVE {{os}}"
...
#!/usr/bin/ansible-playbook
---
 - name: Create Multiple Files
   hosts: praveen
   tasks:
    - name: File Creation
      file: dest=/tmp/{{item}} state=touch
      with_items:
        - file11
        - file22
        - file33
        - file44
...
#!/usr/bin/ansible-playbook
---
 - name: Multiple users creation
   hosts: praveen
   tasks:
     - name: User Creation
       user: name="{{item}}" state=present
       with_items:
             - radha1
             - radha2
             - krishna1
             - krishna2
...
#!/usr/bin/ansible-playbook
--- 
 - name:
   hosts: praveen
   tasks:
     - name: INSTALLING PACKAGEs
       yum: name="{{item}}" state=present
       with_items:
           - ftp
           - vsftpd
           - samba
           - ntp
...
#!/usr/bin/ansible-playbook
---
 - name: "This is to start the service"
   hosts: praveen
   tasks:
     - name: copying files from server
       copy: "src=/etc/ssh/sshd_config dest=/etc/ssh/"
    
     - name: service restarting
       service: "name=sshd state=restarted"
#!/usr/bin/ansible-playbook
---
 - name: This is to install package
   hosts: praveen
   tasks:
    - name: Install httpd
      yum: "name=httpd state=present"
   
    - name: edit the file
      copy: src=/var/www/html/index.html dest=/var/www/html/
      notify: restart the service
   handlers:
  
    - name: restart the service
      service: "name=httpd state=restarted"
...	    
#!/usr/bin/ansible-playbook
---
 - name: This is to start the service
   hosts: praveen
   tasks:

     - name: copying file from server
       copy: src=/etc/ssh/sshd_config dest=/etc/ssh/
       notify: restart the sshd service
   handlers:

     - name: service restarting
       service: name=sshd state=restarted
       listen: restart the sshd service
...	   
#!/usr/bin/ansible-playbook
---
 - name: Copying file from server
   hosts: praveen
   tasks:
    - name: file copying
      copy: src=/etc/ssh/sshd_config dest=/etc/ssh/
      register: edit
    - name: service sshd restarting
      action: service name=sshd state=restarted
      when: edit.changed
...
