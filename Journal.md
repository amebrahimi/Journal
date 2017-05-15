# <big><big><big>index</big></big></big>
* [<strong>How to share folders in windows with ubuntu using vmware</strong>](#how-ho-share-folders-in-windows-with-ubuntu-using-vmware)
* [<strong>How to setup my-sql on ubuntu<strong>](#how-to-setup-my-sql-on-ubuntu)
  * [How to install my-sql on ubuntu](#how-to-install-my-sql-on-ubuntu)
  * [How to Access the MySQL shell](#how-to-access-the-mysql-shell)
  * [How to Create and Delete a MySQL Database](#how-to-create-and-delete-a-mysql-database)
  * [How to Access a MySQL Database](#how-to-access-a-my-sql-database)
  * [How to Create a My SQL Table](#how-to-create-a-my-sql-table)
  * [How to Add Information to a MySQL Table](#how-to-add-information-to-a-my-sql-table)
  * [How to Update Information in the Table](#how-to-update-information-in-the-table)
  * [How to Add and Delete a Column](#how-to-add-and-delete-a-column)
  * [How to Delete a Row](#how-to-delete-a-row)
  * [How to convert a MySQL database to UTF-8 encoding](#how-to-convert-a-mysql-database-to-utf-8-encoding)
	* [Determine the current character encoding set](#Determine-the-current-character-encoding-set)
	* [Convert the character encoding set to UTF-8](#convert-the-character-encoding-set-to-utf-8)
* [<strong>How to install git on ubuntu</strong>](#how-to-install-git-on-ubuntu)
  * [How to generate a new ssh key](#how-to-generate-a-new-ssh-key)
  * [How to copy things into clip board from terminal using xlcip](#how-to-copy-things-into-clip-board-from-terminal-using-xclip)
  * [How to setup Git](#how-to-setup-git)
* [<strong>useful commands</strong>](#useful-commands)
* [<strong>Installing dotnetcore on Linux (Ubuntu)</strong>](#installing-dotnetcore-on-linux)
  * [Add the dotnet apt-get feed](#add-the-dotnet-apt-get-feed)
  * [Install .NET Core SDK](#install-.netcore-sdk)
* [<strong>Some other useful linux tricks</strong>](#some-other-useful-linux-tricks)
* [<strong>Install SQL server on Ubuntu like Linux Distro</strong>](#install-sql-server-on-ubuntu-like-linux-distro)
* [<strong>Install SQL Server on redhat Enterprise Linux</strong>](#install-sql-server-on-redhat-enterprise-linux)
* [<strong>Install Apache web server</strong>](#install-apache-web-server)
  * [Set up the virtual host](#setup-virtual-host)
  * [Configure your virtual host directories](#configure-your-virtual-host-directories)
* [<strong>Config a computer for using ssh pull/push git</strong>](#Config-a-computer-for-using-ssh-pull-/-push-git)
  * [Checking for existing SSh Keys](#checking-for-existing-ssh-keys)
  * [Generating a new SSH key](#generating-a-new-ssh-key)
  * [Adding your SSH key to the ssh-agent](#adding-your-ssh-key-to-the-ssh-agent)
  * [Adding a new SSH key to your GitHub account](#adding-a-new-ssh-key-to-your-github-account)

# My Journal

## How to share folders in windows with ubuntu using vmware

Tuseday, 28 FEB, 2017
i wanted to share some folders with my ubuntu in VMware Workstation and found this [site](http://theholmesoffice.com/how-to-share-folders-between-windows-and-ubuntu-using-vmware-player/) with googling "how to mount a folder in vmware linux" and there was the solution:</br>
1. Power down the machine (shut down ubuntu)</br>
2. Select your VM in VMware Player and click Edit virtual machine settings</br>
3. In the Options tab click *Shared Folders* in the lef hand pane</br>
4. click always enabled in the right and pane and click *ADD*</br>
5. This will take you into the "ADD Shared Folder Wizard"</br>
6. Click *Next* and follow the prompts selecting the folder you want to share. Also name the share -- this is the name that the folder will have in Unbuntu</br>
7. boot into your Ubuntu</br>
8. Shared folders in Ubuntu appear in the location /mnt/hgfs but it probably is not visible.</br>
9. To check to see if Ubuntu is aware of the folder use `vmware-hgfsclient`</br>
10. now enter `sudo vmware-config-tools.pl` follow the prompts, aceepting the default values</br>
11. check to see if that folder is now showing in /mnt/hgfs directory.</br>

******
## How to setup my-sql on ubuntu
i want to setup my-sql on the `tuttifruitti.adad.ws` server to push all my local works to the server. i have searched the google for **digitalocean mysql** and end up with this [site](https://www.digitalocean.com/community/tutorials/a-basic-mysql-tutorial) and here is how its done:</br>
### How to install my-sql on ubuntu
`sudo apt-get install mysql-server`
### How to Access the MySQL shell
Once you have MySQL installed on your droplet, you can access the MySQL shell by typing `mysql -u root -p`</br>
Two points to keep in mind:</br>
* All MySQL commands end with a semicolon; if the phrase does not end with a semicolon, the command will not execute.
* Also, although it is not required, MySQL commands are usually written in uppercase and databases, tables, usernames, or text are in lowercase to make them easier to distinguish. However, the MySQL command line is not case sensitive.</br>

### How to Create and Delete a MySQL Database
MySQL organizes its information into databases; each on can hold tables with specific data.</br>
You can quickly check what databases are available by typing:</br>
```
SHOW DATABASES;
```
Screen should look like this:</br>
```
 mysql> SHOW DATABASES;</br>
 +--------------------+
 | Database           |
 +--------------------+
 | information_schema |
 | mysql              |
 | performance_schema |
 | test               |
 +--------------------+
 4 rows in set (0.01 sec)
```
Creating database is very easy:</br>
```
CREATE DATABASE database name;
```
In this case, for example, we will cal our database "events."</br>
```
  mysql> SHOW DATABASES;
 +--------------------+
 | Database           |
 +--------------------+
 | information_schema |
 | events             |
 | mysql              |
 | performance_schema |
 | test               |
 +--------------------+
 5 rows in set (0.00 sec)
```
In MySQL, the phrase most often used to delete objects is Drop. You would delete a MySQL database with this command:</br>
```
DROP DATABASE database name;
```

### How to Access a MySQL Database

Once we have a new database, we can begin to fill it with information.</br>
</br>
the first step is to create a new table within the larger database.</br>
</br>
Let's open the database we want to use:</br>
```
USE events;
```
in the same way that you could check the available databases, you can also see an overview of the tables that the database contains.</br>
```
SHOW tables;
```
Since this is a new database, MySQL has nothing to show, and you will get a message that says, "Empty set"</br>

### How to Create a My SQL Table

Let's imagine that we are planning a get together of friends. We can use MySQL to track the details of the even.</br>
</br>
Let's create a new MySQL table:

```
CREATE TABLE potluck (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
food VARCHAR(30),
confirmed CHAR(1),
signup_date DATE);
```

<dl>
<dt>This command accomplishes a number of things:</dt>
<dd>1. It has created a table called potluck within the directory, events.</dd>
<dd>2. We have set up 5 columns in the table--id, name, food, confirmed, and signup data.</dd>
<dd>3. The "id" column has a command (INT NOT NULL PRIMARY KEY AUTO_INCREMENT) that automatically numbers each row.</dd>
<dd>4. The "name" column has been limited by VARCHAR command to be under 20 characters long.</dd>
<dd>5. The "food" column designates the food each person will bring. The VARCHAR limits text to be under 30 characters.</dd>
<dd>6. The "confirmed" column redords whether the person has RSVP'd with one letter, Y or N.</dd>
<dd>7. The "date" column will show when they signed up for the events. MySQL requires that dates be written as yyyy-mm-dd</dd>
</dl>

Let's take a look at how the table appears withing the database using the "SHOW TABLES;" command:</br>

```
  mysql> SHOW TABLES;
 +------------------+
 | Tables_in_events |
 +------------------+
 | potluck          |
 +------------------+
 1 row in set (0.01 sec)
```
We can remind ourselves about the table's organization with this command:</br>
```
DESCRIBE potluck;
```
Keep in mind througout that, although the MySQL command line does not pay attention to cases, the table and database names are case sensitive: potluck is not the same as POTLUCK or Potluck.

```
  mysql>DESCRIBE potluck;
 +-------------+-------------+------+-----+---------+----------------+
 | Field       | Type        | Null | Key | Default | Extra          |
 +-------------+-------------+------+-----+---------+----------------+
 | id          | int(11)     | NO   | PRI | NULL    | auto_increment |
 | name        | varchar(20) | YES  |     | NULL    |                |
 | food        | varchar(30) | YES  |     | NULL    |                |
 | confirmed   | char(1)     | YES  |     | NULL    |                |
 | signup_date | date        | YES  |     | NULL    |                |
 +-------------+-------------+------+-----+---------+----------------+
 5 rows in set (0.01 sec)
```

### How to Add Information to a MySQL Table

We have a working table for our party. Now it's time to start filling in the details.</br>
</br>
Use this format to insert information into each row:</br>
```
INSER INTO `potluck` (`id`, `name`, `food`,`confirmed`,`signup_date`) VALUES (NULL, "john", "Casserole", "Y", '2012-04-11');
```
Once you input that in you will see the words:</br>
```
Query OK, 1 row affected (0.00 sec)
```
Let's add a couple more people to our group:</br>
```
INSERT INTO `potluck` (`id`,`name`,`food`,`confirmed`,`signup_date`) VALUES (NULL, "Sandy", "Key Lime Tarts","N", '2012-04-14');
INSERT INTO `potluck` (`id`,`name`,`food`,`confirmed`,`signup_date`) VALUES (NULL, "Tom", "BBQ","Y", '2012-04-18');
INSERT INTO `potluck` (`id`,`name`,`food`,`confirmed`,`signup_date`) VALUES (NULL, "Tina", "Salad","Y", '2012-04-10'); 
```
We can take a look at our table:
```
  mysql> SELECT * FROM potluck;
 +----+-------+----------------+-----------+-------------+
 | id | name  | food           | confirmed | signup_date |
 +----+-------+----------------+-----------+-------------+
 |  1 | John  | Casserole      | Y         | 2012-04-11  |
 |  2 | Sandy | Key Lime Tarts | N         | 2012-04-14  |
 |  3 | Tom   | BBQ            | Y         | 2012-04-18  |
 |  4 | Tina  | Salad          | Y         | 2012-04-10  |
 +----+-------+----------------+-----------+-------------+
 4 rows in set (0.00 sec)
```
Information in the Table
Now that we have started our potluck list, we can address any posiible changes. For example: Sandy has confirmed that sheis attending, so we are going to update that in the table.</br>
```
UPDATE `potluck` 
SET 
`confirmed` = 'Y' 
WHERE `potluck`.`name` ='Sandy';
```
You can also use this command to add information into specific cells, eve if they are empty.</br>
### How to Add and Delete a Column
We are creating a handy chart, but it is missing some important information: our attendee's emails.</br>
</br>
We can easily add this:
```
ALTER TABLE potluck ADD email VARCHAR(40);
```
This command puts the new column called "email" at the end of the table by default, and the VARCHAR command limits it to 40 characters.</br>
</br>
Howeber, if you need to place that column in a specific spot in the table, we can add one more phrase to the command.</br>
```
ALTER TABLE potluck ADD email VARCHAR(40) AFTER name;
```
Now the new "email" column goes after the column "name".</br>
</br>
Just as you can add a column, you can delete one as well:</br>
```
ALTER TABLE potluck DROP email;
```
I guess we will never know how to reach the picnickers.
### How to Delete a Row
If needed, you can also delete rows from the table with the following command:</br>
```
DELETE from [tabel name] where [column name]=[field text];
```
For example if sandy suddenly realied that she will not be able to participate in the potluck after all, we could quickly eliminate her details.</br>
```
  mysql> DELETE from potluck  where name='Sandy';
  Query OK, 1 row affected (0.00 sec)

  mysql> SELECT * FROM potluck;
  +----+------+-----------+-----------+-------------+
  | id | name | food      | confirmed | signup_date |
  +----+------+-----------+-----------+-------------+
  |  1 | John | Casserole | Y         | 2012-04-11  |
  |  3 | Tom  | BBQ       | Y         | 2012-04-18  |
  |  4 | Tina | Salad     | Y         | 2012-04-10  |
  +----+------+-----------+-----------+-------------+
  3 rows in set (0.00 sec)
```
Notice that the id numbers associated with each person remain the same.
## How to convert a MySQL database to UTF-8 encoding
### Determine the current character encoding set
To determine which character encoding set a MySQL database or table is currently using:</br>
 1. Log in to your A2 Hosting SSH account.</br>
 2. At the command line, type the following command, replacing USERNAME with your username:</br>
```
mysql -u USERNAME -p
```
 3. At the Enter Password prompt, type your password. When you type the correct password, the mysql> prompt appears.</br>
 4. To display the current character encoding set for a particular database, type the following command at the mysql> prompt. Replace DBNAME with the database name:</br>
```
SELECT default_character_set_name FROM information_schema.SCHEMATA S WHERE schema_name = "DBNAME";
```
 5. To display the current character encoding set for a particular table in a database, type the following command at the mysql> prompt. Replace DBNAME with the database name, and TABLENAME with the name of the table:</br>
```
SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA WHERE CCSA.collation_name = T.table_collation AND T.table_schema = "DBNAME" AND T.table_name = "TABLENAME";
```
 6. To exit the mysql program, type \q at the mysql> prompt.</br>
### Convert the character encoding set to UTF-8
 1. Log in to your A2 Hosting SSH account.</br>
 2. Create a text file named .my.cnf. To do this, you can use a text editor such as Vim or Nano. This procedure shows how to use Nano. At the command line, type the following command: </br>
```
$ vim .my.cnf
```
 3. Add the following lines to the file, replacing USERNAME with your username and PASSWORD with your password (make sure the password is enclosed in quotation marks):</br>
```
[client]
user=USERNAME
password="PASSWORD"
```
 4. To change the character set encoding to UTF-8 for all of the tables in the specified database, type the following command at the command line. Replace DBNAME with the database name:</br>
```
mysql --database=DBNAME -B -N -e "SHOW TABLES" | awk '{print "SET foreign_key_checks = 0; ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci; SET foreign_key_checks = 1; "}' | mysql --database=DBNAME
```
 5. After the command finishes, type the following command to start the mysql program:</br>
```
$ mysql
```
 6. To change the character set encoding to UTF-8 for the database itself, type the following command at the mysql> prompt. Replace DBNAME with the database name:</br>
```
ALTER DATABASE DBNAME CHARACTER SET utf8 COLLATE utf8_general_ci;
```
 7. To exit the mysql program, type \q at the mysql> prompt.</br>
 8. To delete the .my.cnf file, type the following command at the command line:</br>
```
$ rm .my.cnf
```
 9. To verify that the character set encoding is now set to UTF-8, follow the steps in the [Determine the current character encoding set](#determine-the-current-character-encoding-set) procedure above.


******
# How to install git on ubuntu
First you must update your **apt** package management then you can download and install</br>
```
sudo apt-get update
sudo apt-get install git
```
THIS WILL BE USED ALOT:</br>
### How to generate a new ssh key
paste this text to your terminal:
```
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
and accept all the defaults.[click here for more information](https://help.github.com/articles/working-with-ssh-key-passphrases)</br>
### How to copy things into clip board from terminal using xlcip
First install xclip using:</br>
```
$ sudo apt-get install xclip
```
then copy the thing you want to copy using:
```
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```
Next you must paste the key to -> *settings* -> *SSH and GPG keys* -> *New SSH key* or *Add SSH key*
### How to setup Git

**Today is wednesday, 1 MARCH, 2017 and its 7:40 in the morning**</br>
</br>
We have git installed now we must do something so that we can commit our changes and the easiest way to do that is with `git config` command.</br>
```
$ git config -global user.name "amebrahimi"
$ git config -global user.email "amirebrahimi5@live.com
```
and we can list all the configuration items by typing:</br>
```
$ git config --list
```
******
**For activating and running tuttifruitti site i search among variety of things:**</br>
## useful commands
**Allowing a specific port; Ubuntu ufw firewall**</br>
```
$ sudo ufw allow [port]/[optional: protocol]
```
**How to find out a program is in what group**</br>
```
$ ps aux | grep apache # The username should be in the first column.
```
**How to change a file/folder group**</br>
```
$ chgrp [group_name] [file_name]
```
**How to chage a folder and it's subfolders and contents**</br>
```
$ chgrp -R [group_name] [folder_name]
```
**How t o change group with *chown* Command**</br>
```
$ chown user:group [file/dir]
$ chown :group [file/dir]
```
**How to setup Open VPN on Linux**</br>
```
sudo apt update
sudo apt upgrade -y
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
./openvpn-install.sh
```
******
## Installing dotnetcore on Linux (Ubuntu)

### Add the dotnet apt-get feed
In order to install .NET Core on Ubuntu or Linux Mint, you need to first set up the apt-get feed that hosts the package you need.</br>
```
Ubuntu 16.04
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
```
### Install .NET Core SDK
Before you start, please remove any previous versions of .NET Core from your system by using [this link](https://github.com/dotnet/cli/blob/rel/2.0.0/scripts/obtain/uninstall/dotnet-uninstall-debian-packages.sh). </br>
.NET Core 1.1 is the latest version. For long term support versions and additional downloads check the [all Linux downloads](https://www.microsoft.com/net/download/linux) section.</br>
To install .NET Core 1.1 on Ubuntu or Linux Mint, simply use apt-get.</br>
```
sudo apt-get install dotnet-dev-1.0.1
```
******
## Some other useful linux tricks

finding out our linux version

```
uname -rsv
```
How to change git remote type (from https:// to ssh)</br>
i need this alot: git remote set-url origin git@github.com:amebrahimi/Test.git
******
## Install SQL server on Ubuntu like Linux Distro

1. Import the public respository GPG keys:</br>

```
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
```

2. Register the Microsoft SQL Server Ubuntu Repository:</br>

```
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
```

3. Run the following commands to install SQL Server:</br>

```
sudo apt-get update
sudo apt-get install -y mssql-server
```

4. After the package installation finishes, run *mssql-conf setup* and follow the prompts. Make sure to specify a strong password for the SA account (Minimum length 8 characters, including uppercase and lowercase letters, base 10 digit and /or non-alphanumeric symbols).</br>

```
sudo /opt/mssql/bin/mssql-conf setup
```

5. Once the configuration is done, verify that the service is running:</br>

```
systemctl status mssql-server
```

6. To allow remote connections, you may need to open the SQL Server TCP port on your firewall. The fefault SQL Server port is 1433.</br>

## Install SQL Server on redhat Enterprise Linux

1. Enter Superuser mode</br>

```
sudo su
```
2. Download the Microsoft SQL server Red Hat Repository configurztion file:</br>

```
curl https://packages.microsoft.com/config/rhel/7/mssql-server.repo > /etc/yum.repos.d/mssql-server.repo
```
3. Exit superuser mode.</br>

```
exit
```

4. Run the following commands to install SQL Server:</br>

```
udo yum install -y mssql-server
```

5. After the package installation finishes, run mssql-conf setup and follow the prompts. Make sure to specify a strong password for the SA account (Minimum length 8 characters, including uppercase and lowercase letters, base 10 digits and/or non-alphanumeric symbols).</br>

```
sudo /opt/mssql/bin/mssql-conf setup
```

6. Once the configuration is done, verify that the service is running:</br>

```
systemctl status mssql-server
```

7. To allow remote connections, open the SQL Server port on the firewall on RHEL. The default SQL Server port is TCP 1433. If you are using FirewallD for your firewall, you can use the following commands:</br>

```
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
sudo firewall-cmd --reload
```
******

## Install Apache web server

1. Update packages using yum</br>

```
sudo yum update
```
2. Install Apache</br>

```
sudo yum install httpd
```
3. Start up Apache, so that the httpd service will start automatically on a reboot:</br>

```
sudo service httpd start
```

### Set up the virtual host

1. Create the virtual directories for your domain:</br>

```
sudo mkdir -p /var/www/coolexample.com/public_html
```

2. Change the ownership to the Apache group:</br>

```
sudo chown -R apache:apache /var/www/coolexample.com/public_html
```
This Also lets Apache modify files in your web directories.</br>
3. Change the directorys permissons so they can be read from the internet:</br>

```
sudo chmod -R 755 /var/www/
```

### Configure your virtual host directories

Were going to copy a configuration usually used in Ubuntu/Debian and create two directories: one to store virtual host files (sites-available) and another to hold symbolic links to virtual hosts that will be published (sites-enabled).</br>
</br>
**Create sites-available and sites-enabled directories**</br>
Create thedirectories:
```
sudo mkdir /etc/httpd/sites-available
```
```
sudo mkdir /etc/httpd/sites-enabled
```

**Edit your Apache configuration file**</br>
Edit the main configuration file (httpd.conf) so that Apache will look for virual hosts in the sites-enabled directory.</br>

1. Open your onfig file:</br>
```
sudo vim /etc/httpd/conf/httpd.conf
```
2. Add this line at the very end of the file:</br>
```
IncludeOptional sites-enabled/*.conf
```
This way, were telling Apache to look for additional config files in the sites-enabled direcotry.</br>
3. Save and colose the file:</br>
```
wq!
```

**Create virual host file**</br>
1. Create a new config file:</br>
```
sudo vim /etc/httpd/sites-available/coolexample.com.conf
```
2. Paste this code in, replacing your own domain for coolexample.com.conf.</br>
Heres what the whole file could look like after your changes:</br>
```
<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host.example.com    
    ServerName www.coolexample.com
    ServerAlias coolexample.com 
    DocumentRoot /var/www/coolexample.com/public_html 
    ErrorLog /var/www/coolexample.com/error.log 
    CustomLog /var/www/coolexample.com/requests.log combined 
</VirtualHost>
```
The lines ErrorLog and CustomLog are not required to set up your virtual host, but weve included them, in case you do want to tell Apache where to keep error and request logs for your site.</br>
Enable your virtual host file with a sym link to the sites-enabled directory:</br>
```
sudo ln -s /etc/httpd/sites-available/coolexample.com.conf /etc/httpd/sites-enabled/coolexample.com.conf
```
Restart Apache:</br>
```
sudo service httpd restart
```
******
## Config a computer for using ssh pull/push git
### Checking for existing SSh Keys
1. Open Terminal.</br>
2. Enter `ls -al ~/.ssh` to see if existing SSH keys are present</br>
3. Check the directory listing to see if you already have a public SSH key.</br>If you don't have an existing public and private key pair, or don't wish to use any that are available to connect to GitHub, then generate a new SSH key.</br>
### Generating a new SSH key
1. Open terminal</br>
2. Paste the text below, substituting in your GitHub email address.</br>
```
$ ssh-keygen -t rsa -b 4096 -c "your_email@example.com"
```
This creates a new ssh key, using the provided email as a lable.</br>
3. when you're prompted to "Enter a file in which to save the key," press Enter. This accepsts the default file location.</br>
4. At the prompt, type a secure passphrase.(or press enter)</br>
### Adding your SSH key to the ssh-agent
1. Satrt the ssh-agent in the background.</br>
```
$ eval "$(ssh-agent -s)"
```
2. Add your SSH private key to the ssh-agent. if you created your key with a different name, or if you are adding an existing key tha has a different name, replace id_rsa in the command with the name of your private key file.</br>
```
$ ssh-add ~/.ssh/id_rsa
```
### Adding a new SSH key to your GitHub account
1. Copy the SSH key to your clipboard.</br>
If your SSH key files has a different name than the example code, moidfy the filename to match your current setup. Wnen copying your key, don't add any newlines or whitespace.
```
$ sudo apt-get install xlclip
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```
2. In the Upper-right corner of any page, click your profile photo, then click Settings.</br>
3. In the User Settings sidebar, click SSH and GPG keys.</br>
4. Click **New SSH key** or **Add SSH key**.
5. Click the "Title" field, add a desciptive label for the new key. For Example, if you're using a personal Mac, you might call this key "Personal MacBook Air".</br>
6. Paste your key into the "key" field.</br>
7. Click **Add SSH key**.</br>
8. if prompted, confirm your GitHub password.
