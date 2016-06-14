usage:
node 'pup1.pp.ciklum.com' {

  $adminemail = 'webmaster@pup1.pp.ciklum.com'
  $servername = 'pup1.pp.ciklum.com'
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
