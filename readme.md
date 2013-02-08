# The Dataverse Network (DVN) Install Demo

"The Dataverse Network is an open source application to publish, share, reference, extract and analyze research data." -- http://thedata.org

## What is this?

This git repo allows you to practice installing a Dataverse Network (DVN) on a virtual machine (VM) on your computer.

The VM will be running CentOS 6 and the following software:

- DVN 3.3
- Glassfish 3.1.2.2
- PostgreSQL 8.4.13
- OpenJDK 1.6.0

Please note that in production we do **not** recommend OpenJDK. We recommend the official Java from Oracle.  OpenJDK is used here because it's easy to install.

## Installing dependencies

Before you can use this git repo, you need to install VirtualBox from https://virtualbox.org and Vagrant from http://vagrantup.com 

FIXME: Right now you'll need a 64 bit "host" operating system. For discussion of this issue, please see https://groups.google.com/d/msg/dataverse-community/wRxRSGE8VpQ/gfzPqszeEi4J

## Using this git repo to practice installing a DVN 

After running the commands below you should be able to log in:

- <http://localhost:8888/dvn/>
- username: networkAdmin
- password: networkAdmin

Please note that the first few commands are executed from a Mac called "murphy" but following `vagrant ssh` the rest of the commands are exectuted on the newly-created VM itself ("logus").

    murphy:~ pdurbin$ cd git clone https://github.com/dvn/dvn-install-demo.git
    murphy:~ cd dvn-install-demo
    murphy:dvn-install-demo pdurbin$ vagrant up
    [default] Importing base box 'centos'...
    [default] The guest additions on this VM do not match the install version of
    VirtualBox! This may cause things such as forwarded ports, shared
    folders, and more to not work properly. If any of those things fail on
    this machine, please update the guest additions and repackage the
    box.

    Guest Additions Version: 4.1.18
    VirtualBox Version: 4.2.4
    [default] Matching MAC address for NAT networking...
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
    notice: /Stage[packages]/Packages/Package[postgresql-server]/ensure: created
    notice: /Stage[packages]/Packages/Package[java-1.6.0-openjdk]/ensure: created
    notice: /Stage[packages]/Packages/Package[java-1.6.0-openjdk-devel]/ensure: created
    notice: /Stage[packages]/Packages/Package[postfix]/ensure: created
    notice: /Stage[packages]/Packages/Package[elinks]/ensure: created
    notice: /Stage[main]/Sysprep/File[/root/glassfish-install.sh]/ensure: defined content as '{md5}f6074a40ed3c9d7974a13397f111b7c8'

    notice: /Stage[main]/Sysprep/File[/root/glassfish-answerfile]/ensure: defined content as '{md5}9d4c334cc638f6a5fda1d85f2066d692'

    notice: /Stage[main]/Sysprep/File[/etc/sysconfig/iptables]/content: content changed '{md5}5ee09def44bd598f82e3717df846e2fc' to '{md5}2d71c6ee37854db2b9e61540ed987ecb'

    notice: /Stage[main]/Sysprep/Service[iptables]: Triggered 'refresh' from 1 events
    notice: /Stage[main]/Sysprep/Service[postfix]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[downloads]/Downloads/Exec[download_dvn_zip]/returns: executed successfully

    notice: /Stage[postgresinit]/Postgresinit/Exec[postgres_init]/returns: executed successfully
    notice: /Stage[postgres]/Postgres/File[/var/lib/pgsql/data/pg_hba.conf]/content: content changed '{md5}a21038ed8e80ad95d01da9cb6b0ae403' to '{md5}a634189d83263d566f9a6874c11fcd57'

    notice: /Stage[postgres]/Postgres/Service[postgresql]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[glassfish]/Glassfish/Exec[install_glassfish]/returns: executed successfully
    notice: Finished catalog run in 461.44 seconds

    murphy:dvn-install-demo pdurbin$ 
    murphy:dvn-install-demo pdurbin$ vagrant ssh
    Last login: Tue Jul 10 22:56:01 2012 from 10.0.2.2
    [vagrant@logus ~]$ sudo su -
    [root@logus ~]# ls
    anaconda-ks.cfg            glassfish-answerfile  install.log.syslog
    dvninstall_v3_3.zip        glassfish-install.sh
    glassfish-3.1.2.2-unix.sh  install.log
    [root@logus ~]# jar xvf dvninstall_v3_3.zip 
     inflated: dvninstall/domain.xml.TEMPLATE
     inflated: dvninstall/install
     inflated: dvninstall/pgdriver/postgresql-8.3-603.jdbc4.jar
     inflated: dvninstall/pgdriver/postgresql-8.4-703.jdbc4.jar
     inflated: dvninstall/pgdriver/postgresql-9.0-802.jdbc4.jar
     inflated: dvninstall/pgdriver/postgresql-9.1-902.jdbc4.jar
     inflated: dvninstall/appdeploy/dist/DVN-web.war
     inflated: dvninstall/config/error.xsl
     inflated: dvninstall/config/fgdc2ddi.xsl
     inflated: dvninstall/config/graphml.props
     inflated: dvninstall/config/header.xsl
     inflated: dvninstall/config/jhove.conf
     inflated: dvninstall/config/logging.properties
     inflated: dvninstall/config/metadata.xsl
     inflated: dvninstall/config/mif2ddi.xsl
     inflated: dvninstall/config/neodb.props
     inflated: dvninstall/config/oai_dc2ddi.xsl
     inflated: dvninstall/config/oaicat.properties
     inflated: dvninstall/web-core.jar
     inflated: dvninstall/robots.txt
     inflated: dvninstall/referenceData.sql.TEMPLATE
     inflated: dvninstall/config/networkData/lib/collections-generic-4.01.jar
     inflated: dvninstall/config/networkData/lib/colt-1.2.0.jar
     inflated: dvninstall/config/networkData/lib/concurrent-1.3.4.jar
     inflated: dvninstall/config/networkData/lib/geronimo-jta_1.1_spec-1.1.1.jar
     inflated: dvninstall/config/networkData/lib/jung-algorithms-2.0.jar
     inflated: dvninstall/config/networkData/lib/jung-api-2.0.jar
     inflated: dvninstall/config/networkData/lib/jung-visualization-2.0.jar
     inflated: dvninstall/config/networkData/lib/junit-3.8.1.jar
     inflated: dvninstall/config/networkData/lib/lucene-core-2.9.2.jar
     inflated: dvninstall/config/networkData/lib/neo4j-index-1.1.jar
     inflated: dvninstall/config/networkData/lib/neo4j-kernel-1.1.jar
     inflated: dvninstall/config/networkData/lib/neo4j-utils-1.1.jar
     inflated: dvninstall/config/networkData/lib/nestedvm-1.0.jar
     inflated: dvninstall/config/networkData/lib/network_utils-1.0-SNAPSHOT.jar
     inflated: dvninstall/config/networkData/lib/sqlite-jdbc-3.6.16.jar
     inflated: dvninstall/appdeploy/ant-deploy.xml
     inflated: dvninstall/appdeploy/build-impl.xml
     inflated: dvninstall/appdeploy/build.xml
     inflated: dvninstall/appdeploy/glassfish.properties.TEMPLATE
     inflated: dvninstall/appdeploy/private.properties
     inflated: dvninstall/appdeploy/project.properties
     inflated: dvninstall/appdeploy/AS.properties.TEMPLATE
    [root@logus ~]# cd dvninstall
    [root@logus dvninstall]# ls
    appdeploy  domain.xml.TEMPLATE  pgdriver                    robots.txt
    config     install              referenceData.sql.TEMPLATE  web-core.jar
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

    OK, done!

    Starting glassfish, again:

    Waiting for domain1 to start .................................................................................................................................................................................................................................................................
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
                                                                           v. 3.3
