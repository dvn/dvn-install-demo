# The Dataverse Network (DVN) Install Demo

"The Dataverse Network is an open source application to publish, share, reference, extract and analyze research data." -- http://thedata.org

## What is this?

This git repo allows you to practice installing a Dataverse Network (DVN) on a virtual machine (VM) on your computer.

The VM will be running CentOS 6 and the following software:

- DVN 3.6
- Glassfish 3.1.2.2
- PostgreSQL 8.4.13
- OpenJDK 1.6.0

Please note that in production we do **not** recommend OpenJDK 1.6. We recommend the official Java 1.6 from Oracle. OpenJDK is used here because it's easy to install.

## Installing dependencies

Before you can use this git repo, you need to install VirtualBox from https://virtualbox.org and Vagrant from http://vagrantup.com 

FIXME: Right now you'll need a 64 bit "host" operating system. For discussion of this issue, please see https://groups.google.com/d/msg/dataverse-community/wRxRSGE8VpQ/gfzPqszeEi4J

## Using this git repo to practice installing a DVN 

After running the commands below you should be able to log in:

- <http://localhost:8888/dvn/>
- username: networkAdmin
- password: networkAdmin

Please note that the first few commands are executed from a Mac called "murphy" but following `vagrant ssh` the rest of the commands are executed on the newly-created VM itself ("logus"). Output has been trimmed for clarity.

    murphy:~ pdurbin$ cd git clone https://github.com/dvn/dvn-install-demo.git
    murphy:~ cd dvn-install-demo
    murphy:dvn-install-demo pdurbin$ vagrant up
    [default] Importing base box 'puppet-vagrant-boxes-centos-64-x64-vbox4210'...
    notice: /Stage[postgres]/Postgres/Service[postgresql]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[glassfish]/Glassfish/Exec[install_glassfish]/returns: executed successfully
    notice: Finished catalog run in 396.66 seconds
    murphy:dvn-install-demo pdurbin$ 
    murphy:dvn-install-demo pdurbin$ vagrant ssh
    Last login: Tue Jul 10 22:56:01 2012 from 10.0.2.2
    [vagrant@logus ~]$ sudo su -
    [root@logus ~]# ls
    anaconda-ks.cfg            glassfish-answerfile  install.log.syslog
    dvninstall_v3_6.zip      glassfish-install.sh
    glassfish-3.1.2.2-unix.sh  install.log
    [root@logus ~]# jar xvf dvninstall_v3_6.zip
     inflated: dvninstall/domain.xml.TEMPLATE
     ...
     inflated: dvninstall/appdeploy/AS.properties.TEMPLATE
    [root@logus ~]# cd dvninstall
    [root@logus dvninstall]# ls
    appdeploy  domain.xml.TEMPLATE  referenceData.sql.TEMPLATE
    config     install              robots.txt
    doc        pgdriver             web-core.jar
    [root@logus dvninstall]# perl install

    Welcome to the DVN installer.
    You will be guided through the process of setting up a NEW
    instance of the DVN application

    This appears to be a RedHat system; good.

    Please enter the following configuration values:
    (hit [RETURN] to accept the default value)

    Internet Address of your host: [logus.law.harvard.edu] 

    Glassfish Directory: [/usr/local/glassfish3] 

    SMTP (mail) server to relay notification messages: [localhost] 

    Postgres Server: [localhost] 

    Postgres Server Port: [5432] 

    Name of the Postgres Database: [dvnDb] 

    Name of the Postgres User: [dvnApp] 

    Postgres user password: [secret] 

    Rserve Server: [localhost] 

    Rserve Server Port: [6311] 

    Rserve User Name: [rserve] 

    Rserve User Password: [rserve] 


    OK, please confirm what you've entered:

    Internet Address of your host: logus.law.harvard.edu
    Glassfish Directory: /usr/local/glassfish3
    SMTP (mail) server to relay notification messages: localhost
    Postgres Server: localhost
    Postgres Server Port: 5432
    Name of the Postgres Database: dvnDb
    Name of the Postgres User: dvnApp
    Postgres user password: secret
    Rserve Server: localhost
    Rserve Server Port: 6311
    Rserve User Name: rserve
    Rserve User Password: rserve

    Is this correct? [y/n] y

    Checking system user "postgres"... OK.


    Found Postgres psql command, version 8.4.13. Good.


    Configuring Postgres Database:
    Checking if a local instance of Postgres is running and accessible...
    Yes, it is.

    Creating Postgres user (role) for the DVN:
    CREATE ROLE
    done.

    Creating Postgres database:

    Proceeding with the Glassfish setup.

    Checking your Glassfish installation...OK!

    Setting the heap limit for Glassfish to 373MB. 
    You may need to adjust this setting to better suit 
    your system.


    Press any key to continue...




    Writing glassfish configuration file (domain.xml)... done.

    Copying additional configuration files... done!

    Installing the Glassfish PostgresQL driver... done!

    Stopping glassfish...
    CLI306 Warning - The server located at /usr/local/glassfish3/glassfish/domains/domain1 is not running.
    Command stop-domain executed successfully.

    Starting glassfish.
    Waiting for domain1 to start .................................................
    Successfully started the domain : domain1
    domain  Location: /usr/local/glassfish3/glassfish/domains/domain1
    Log File: /usr/local/glassfish3/glassfish/domains/domain1/logs/server.log
    Admin Port: 4848
    Debugging is enabled.  The debugging port is: 9009
    Command start-domain executed successfully.

    Attempting to deploy the application:

    Application deployed with name DVN-web.
    Command deploy executed successfully.

    OK; now we are going to stop glassfish and populate the database with
    some initial content, then start glassfish again.
    Waiting for the domain to stop ..
    Command stop-domain executed successfully.

    Populating the database (local PostgresQL instance):

    SET
    SET
    SET
    SET
     setval 
    --------
         10
    (1 row)

     setval 
    --------
         10
    (1 row)

     setval 
    --------
        500
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
         10
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
         10
    (1 row)

     setval 
    --------
         10
    (1 row)

     setval 
    --------
        150
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
          1
    (1 row)

     setval 
    --------
         10
    (1 row)

    ALTER TABLE
    [snip]
    INSERT 0 1
    INSERT 0 1

    OK, done!

    Starting glassfish, again:

    Waiting for domain1 to start .............................................................................................................................................................................................................................
    Successfully started the domain : domain1
    domain  Location: /usr/local/glassfish3/glassfish/domains/domain1
    Log File: /usr/local/glassfish3/glassfish/domains/domain1/logs/server.log
    Admin Port: 4848
    Debugging is enabled.  The debugging port is: 9009
    Command start-domain executed successfully.

    You should now have a running DVN instance;
    Please go to the application at the following URL:

      http://logus.law.harvard.edu/dvn

    and log in by using "networkAdmin" as both the user name
    and password. Click the "networkAdmin" link on the right side
    Of the main screen, then click "Update Account". Change this
    default password and default e-mail address.


    Finally, checking if Rserve is running and accessible...
    Could not establish connection to localhost
    on port 6311, the address you provided
    for your R server.
    DVN can function without a working R server, but
    much of the functionality concerning running statistics
    and analysis on quantitative data will not be available.
    Please consult the "Installing R" section in the Installers guide
    for more info.
    [root@logus dvninstall]# 
    [root@logus dvninstall]# elinks --dump http://localhost/dvn/ | head -3
                                      [1]Powered by the Dataverse Network Project
                                                                         v. 3.6

## Starting the VM again after it has been shut down

If you've stopped the VM and later want to resume working on it you'll want to type `vagrant up` to start it...

    [pdurbin@tabby dvn-install-demo]$ vagrant up
    [default] VM already created. Booting if it's not already running...
    [default] Clearing any previously set forwarded ports...
    [default] Forwarding ports...
    [default] -- 22 => 2222 (adapter 1)
    [default] -- 80 => 8888 (adapter 1)
    [default] Creating shared folders metadata...
    [default] Clearing any previously set network interfaces...
    [default] Running any VM customizations...
    [default] Booting VM...
    [default] Waiting for VM to boot. This can take a few minutes.
    [default] VM booted and ready for use!
    [default] Mounting shared folders...
    [default] -- v-root: /vagrant
    [default] -- manifests: /tmp/vagrant-puppet/manifests
    [default] -- v-pp-m0: /tmp/vagrant-puppet/modules-0
    [default] Running provisioner: Vagrant::Provisioners::Puppet...
    [default] Running Puppet with /tmp/vagrant-puppet/manifests/init.pp...
    notice: Finished catalog run in 2.12 seconds

... but by default, Glassfish does not start at boot so you won't be able to reach <http://localhost:8888/dvn/>. To start Glassfish, we `vagrant ssh` to to VM, become root, and start Glassfish with `asadmin`:

    [pdurbin@tabby dvn-install-demo]$ vagrant ssh
    Last login: Wed Jan 23 04:14:47 2013 from 10.0.2.2
    [vagrant@localhost ~]$ sudo su -
    [root@localhost ~]# /usr/local/glassfish3/glassfish/bin/asadmin start-domain
    Waiting for domain1 to start ...............................................................................
    Successfully started the domain : domain1
    domain  Location: /usr/local/glassfish3/glassfish/domains/domain1
    Log File: /usr/local/glassfish3/glassfish/domains/domain1/logs/server.log
    Admin Port: 4848
    Debugging is enabled.  The debugging port is: 9009
    Command start-domain executed successfully.
    [root@localhost ~]# 

## API Testing

The DVN 3.x APIs require https which is on port 9999 in the Vagrant environment.

The location of the Data Deposit API Service Document, for example, is <https://localhost:9999/dvn/api/data-deposit/v1/swordv2/service-document>

## Installing R and Rserve

When we ran the DVN installer above we didn't install R or Rserve, which are optional components. We saw this message in the output:

> Could not establish connection to localhost on port 6311, the address you provided for your R server.  DVN can function without a working R server, but much of the functionality concerning running statistics and analysis on quantitative data will not be available.  Please consult the "Installing R" section in the Installers guide for more info.

Before we install R and Rserve, let's see what happens if we we try to run "Access Analysis + Subsetting" on a file when we don't have R and Rserve installed. We create a dataverse and study, upload a subsettable file, and click "Access Analysis + Subsetting" which shows us this error in our browser...

    XML Parsing Error: no element found
    Location: http://localhost:8888/dvn/dv/dv1/faces/subsetting/SubsettingPage.xhtml?dtId=1&versionNumber=1
    Line Number 1, Column 1: 

... and this error in at /usr/local/glassfish3/glassfish/domains/domain1/logs/server.log:

    [#|2013-02-08T15:26:11.255+0100|SEVERE|glassfish3.1.2|javax.enterprise.system.std.com.sun.enterprise.server.logging|_ThreadID=24;_ThreadName=Thread-2;|javax.servlet.ServletException: Cant instantiate class: edu.harvard.iq.dvn.core.web.subsetting.AnalysisApplicationBean.

Now, let's correct this by following <http://guides.thedata.org/book/2c-r-and-rserve> to install R and Rserve:

    [pdurbin@tabby dvn-install-demo]$ vagrant ssh
    [vagrant@localhost ~]$ sudo su -
    [root@localhost ~]# yum install R R-devel
    (snip)
    No package R available.
    No package R-devel available.
    Error: Nothing to do
    [root@localhost ~]# 

Hmm, no package available. Per the guide, we need to enable the [Extra Packages for Enterprise Linux (EPEL)](http://fedoraproject.org/wiki/EPEL) yum repo first.

    [root@localhost ~]# yum install http://mirror.hmdc.harvard.edu/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

Now that EPEL is enabled, we should be able to install R and R-devel and their few dozen dependencies:

    [root@localhost ~]# yum install R R-devel

Now, let's download dvnextra.tar and continue:

    [root@localhost ~]# wget http://dvn.iq.harvard.edu/dist/R/dvnextra.tar
    --2013-02-08 15:56:31--  http://dvn.iq.harvard.edu/dist/R/dvnextra.tar
    Resolving dvn.iq.harvard.edu... 128.103.69.226
    Connecting to dvn.iq.harvard.edu|128.103.69.226|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 8960000 (8.5M) [application/x-tar]
    Saving to: “dvnextra.tar”

    100%[===========================================================================================================>] 8,960,000   1.75M/s   in 4.7s    

    2013-02-08 15:56:41 (1.80 MB/s) - “dvnextra.tar” saved [8960000/8960000]

    [root@localhost ~]# tar xvf dvnextra.tar 
    dvnextra/
    dvnextra/accuracy_1.35.tar.gz
    dvnextra/VDCutil_1.17.tar.gz
    dvnextra/vdc_startup.R
    dvnextra/Rserv.conf
    dvnextra/Zelig_3.5.4.tar.gz
    dvnextra/installModules.sh
    dvnextra/rserve
    dvnextra/UNF_1.16.tar.gz
    dvnextra/Rserv.pwd
    dvnextra/R2HTML.css
    [root@localhost ~]# cd dvnextra
    [root@localhost dvnextra]# ./installModules.sh 

    Installing additional R packages.

    PLEASE NOTE: this may take a while (up to an hour)!

    Also: 
    Compiling these modules will generate a VERY large amount of output.
    All these messages that you'll see on screen will also be saved
    in several .LOG files in this directory.
    If anything goes wrong during this installation, please send these
    files to the DVN support team

    (snip)

    * DONE (Zelig)
    FINISHED INSTALLING Zelig

    installing package VDCUtil (from local source):

    installing DVN startup files:

    checking Rserve configuration:

    installing Rserv configuration file.

    Installing Rserve password file.
    Please change the default password in /etc/Rserv.pwd
    (and make sure this password is set correctly as a
    JVM option in the glassfish configuration of your DVN)

    Installing Rserve startup file.
    You can start Rserve daemon by executing
      service rserve start

    Successfully installed DVN R framework.

    [root@localhost dvnextra]# service rserve start
    Starting Rserve daemon: .
    [root@localhost dvnextra]# 

Now the "Access Analysis + Subsetting" link we tried before should work. The bottom of the page should say "Statistical analysis powered by Zelig."


##Issues with installing Glassfish

Some users encounter issues with Glassfish installing, receiving this error (usually while installing on Windows 7):

    Checking your Glassfish installation...
    Invalid Glassfish directory /usr/local/glassfish3!
    Enter the root directory of your Glassfish installation:
    (Or ctrl-C to exit the installer):

If this happens, follows these simple steps to get back on track with the installation:

(1) After typing `vagrant ssh` and `sudo su -` in the instructions, run `sh glassfish-install.sh` from the command prompt. This will download `glassfish-3.1.2.2-unix.sh`, then fail with the error:

     : command not foundh: line 3:
     This program requires DISPLAY environment variable to be set.
     Please re-run after assigning an appropriate value to DISPLAY.

(2) Run `sh glassfish-3.1.2.2-unix.sh -a /root/glassfish-answerfile -s`.  This reruns the Unix-specific Glassfish install shell file with the answer file that passes the necessary paths to the installer.  

Continue with the instructions above by typing `jar xvf dvninstall_v3_6.zip`.  Glassfish should be in the proper directory (`/usr/local/glassfish3`) and all will be right with the world again. 

For more information, see the page in the [DVN wiki](https://github.com/IQSS/dvn/wiki/DVN-Install-Demo-on-Windows-7) documenting this workaround and the [original email thread](https://groups.google.com/d/topic/dataverse-community/wRxRSGE8VpQ/discussion) discussing this issue.
