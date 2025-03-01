
Prerequisites :
apache2 or httpd installation required.

Set-Up Project :

1. Clone the repository and copy project folder cgibash in /var/www/html.

2. Configure Virtualhost in /etc/apache2/sites-enabled/000-default.conf or /etc/httpd/conf/httpd.conf

<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html/cgibash
        ServerName cgibash
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
# To make apache execute cgibash script
<Directory "/var/www/html/test/cgibash">
    Options +ExecCGI
    AddHandler cgi-script .sh
    Require all granted
</Directory>
</VirtualHost>

3. Add the line in /etc/hosts file
127.0.0.1 cgibash

4. Enable cgi module for apache2
sudo a2enmod cgi
(a2enmod does not work in httpd. It is enabled by default. If not check the following line is cuncommented in /etc/httpd/conf/httpd.conf
LoadModule cgi_module modules/mod_cgi.so )

5. Restart apache2 or httpd
sudo service httpd restart
sudo service apache2 restart

6. Open the application.
http://cgibash
