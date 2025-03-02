### Description ###   
A CGI Shell Script (BASH) Web Application   
cgibash is an html and shell script based web application where shell script is used as a backend scripting.   
The main purpose of the project is to use cgi module of the apache and implement role based logins.   
   
There are two roles implemented in the application i.e. user and admin. It creates separate sessions for separate users.   
   
Login Details :   
http://cgibash/login.html   
User Login   
username : user1   
password : user1   
   
Admin Login :   
username : admin   
password : admin   
   
**-- Pavitra Kanetkar**   
##############################################   
**Prerequisites** :  
a) apache2 or httpd installation   
b) sqlite3 installation   

**Set-Up Project** :   
1. Clone the repository and copy project folder cgibash in **/var/www/html**.

2. Configure Virtualhost in **/etc/apache2/sites-enabled/000-default.conf** or **/etc/httpd/conf/httpd.conf**
```
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html/cgibash
        ServerName cgibash
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
#### To make apache2/httpd execute cgi-bash scripts
<Directory "/var/www/html/test/cgibash">
    Options +ExecCGI
    AddHandler cgi-script .sh
    Require all granted
</Directory>
</VirtualHost>
```

3. Add the line in **/etc/hosts** file
```
127.0.0.1 cgibash
```

5. Enable cgi module for apache2
```
sudo a2enmod cgi
```
(**a2enmod** does not work in httpd. The modules cgi is enabled by default. If it is not enabled, you need to check the following line is uncommented in **/etc/httpd/conf/httpd.conf**   
**LoadModule cgi_module modules/mod_cgi.so** )

6. Restart apache2 or httpd
```
sudo service httpd restart
sudo service apache2 restart
```

8. Open the application.
```
http://cgibash
```
