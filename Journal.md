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
i need this alot: git remote origin git@github.com:amebrahimi/Test.git
******

