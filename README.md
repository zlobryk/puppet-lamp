## Usage

### Default setup
Create a manifest that has the following code:

```puppet
node 'ubuntu.example.com' {

  $adminemail = 'webmaster@example.com'
  $servername = 'ubuntu.example.com'
 #Password for mysql database
 $mysql_password = "myT0pS3cretPa55worD"
  include apache
  include apache::vhosts
  include php
  include mysql
}
 #node 'centoshost.example.com' {
 #  $adminemail = 'webmaster@example.com'
 #  $servername = 'hostname.example.com'
 #  $mysql_password = "myT0pS3cretPa55worD"
 #  include apache
 #  include apache::vhosts
 #  include php
 #  include mysql
 # }
```
