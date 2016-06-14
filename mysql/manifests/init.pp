 class mysql {
#   # root password
#   $rootPassword = 'password'
# 
#   # install mysql
   package { 'mysql-server':
     ensure  => latest,
   }
# 
#   # start service
   service { 'mysql':
     ensure  => running,
     require => Package['mysql-server'],
     provider => 'init',
   }
# 
#   # set root password
   exec { 'set-mysql-password':
     unless  => 'mysqladmin -uroot -p$mysql_password status',
     path => ["/bin", "/usr/bin"],
     command => 'mysqladmin -uroot password $mysql_password',
     require => Service['mysql'],
   }
 }

#class mysql {
#  
#  package { "mysql-server": ensure => installed }
# package { "mysql": ensure => installed }
#
#  service { "mysqld":
#    enable => true,
#    ensure => running,
#    require => Package["mysql-server"],
#  }

#  file { "/var/lib/mysql/my.cnf":
#    owner => "mysql", group => "mysql",
#    source => "puppet:///mysql/my.cnf",
#    notify => Service["mysqld"],
#    require => Package["mysql-server"],
#  }
 
#  file { "/etc/my.cnf":
#    require => File["/var/lib/mysql/my.cnf"],
#    ensure => "/var/lib/mysql/my.cnf",
#  }

#  exec { "set-mysql-password":
#    unless => "mysqladmin -uroot -p$mysql_password status",
#    path => ["/bin", "/usr/bin"],
#    command => "mysqladmin -uroot password $mysql_password",
#    require => Service["mysqld"],
#  }
#}
