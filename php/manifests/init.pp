class php {
if $::osfamily == 'RedHat' {
# package install list
  $packages = [
    "php",
    "php-cli",
    "php-mysql",
    "php-pear",
    "php-dev",
    "php-gd",
    "php-mcrypt",
  ]
  package { $packages:
    ensure => present,
  }
exec { "restart apache service":
     command => "apachectl restart",
     path    => "/usr/sbin:bin:/usr/bin",
  } 
}
elsif $::osfamily == 'Debian' {
# package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5"
  ]
  package { $packages:
    ensure => present,
  }
exec { "restart apache service":
     command => "apache2ctl restart",
     path    => "/usr/sbin:bin:/usr/bin",

  } 
 }
}
