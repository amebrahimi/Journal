#My Journal
##How to share folders in windows with ubuntu using vmware
Tuseday, 28 FEB, 2017
i wanted to share some folders with my ubuntu in VMware Workstation and found this [site](http://theholmesoffice.com/how-to-share-folders-between-windows-and-ubuntu-using-vmware-player/) with googling "how to mount a folder in vmware linux" and there was the solution:</br>
1. Power down the machine (shut down ubuntu)</br>
2. Select your VM in VMware Player and click Edit virtual machine settings</br>
3. In the Options tab click *Shared Folders* in the lef hand pane</br>
4. click always enabled in the right and pane and click *ADD*</br>
5. This will take you into the "ADD Shared Folder Wizard"</br>
6. Click *Next* and follow the prompts selecting the folder you want to share. Also name the share -- this is the name that the folder will have in Unbuntu</br>
7. boot into your Ubuntu</br>
this will be used more often
---------------------------
8. Shared folders in Ubuntu appear in the location /mnt/hgfs but it probably is not visible.</br>
9. To check to see if Ubuntu is aware of the folder use `vmware-hgfsclient`</br>
10. now enter `sudo vmware-config-tools.pl` follow the prompts, aceepting the default values</br>
11. check to see if that folder is now showing in /mnt/hgfs directory.</br>

******
##How to setup my-sql on ubuntu
i want to setup my-sql on the `tuttifruitti.adad.ws` server to push all my local works to the server. i have searched the google for **digitalocean mysql** and end up with this [site](https://www.digitalocean.com/community/tutorials/a-basic-mysql-tutorial) and here is how its done:</br>
###How to install my-sql on ubuntu
`sudo apt-get install mysql-server`
###How to Access the MySQL shell
Once you have MySQL installed on your droplet, you can access the MySQL shell by typing `mysql -u root -p`</br>
******
How to change git remote type (from https:// to ssh)</br>
i need this alot: git remote set-url origin git@github.com:amebrahimi/Test.git
******
Two points to keep in mind:</br>
* All MySQL commands end with a semicolon; if the phrase does not end with a semicolon, the command will not execute.
* Also, although it is not required, MySQL commands are usually written in uppercase and databases, tables, usernames, or text are in lowercase to make them easier to distinguish. However, the MySQL command line is not case sensitive.</br>

###How to Create and Delete a MySQL Database
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

###How to Access a MySQL Database
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
<dd>7. The "date" column will show when they signed up for the events. MySQL requires that dates be written as yyyy-mm-dd
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
`DESCRIBE potluck;`</br>
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
### How to Update Information in the Table
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
###How to Delete a Row
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
******
##How to install git on ubuntu
First you must update your **apt** package management then you can download and install</br>
```
sudo apt-get update
sudo apt-get install git
```
******
THIS WILL BE USED ALOT:</br>
## How to generate a new ssh key
paste this text to your terminal:
```
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
and accept all the defaults.[click here for more information](https://help.github.com/articles/working-with-ssh-key-passphrases)</br>
## How to copy things into clip board from terminal using xlcip
First install xclip using:</br>
```
$ sudo apt-get install xclip
```
then copy the thing you want to copy using:
```
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```
Next you must paste the key to -> *settings* -> *SSH and GPG keys* -> *New SSH key* or *Add SSH key*
******
###How to setup Git

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
