class apache::vhosts {
        
  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rh.conf.erb'),
    }
    file { "/etc/httpd/sites-enabled/$servername.conf":
      ensure => 'link',
      target => "/etc/httpd/sites-available/$servername.conf",
    }
    file { "/etc/httpd/sites-enabled/000-default.conf":
    ensure  => 'absent',
    purge   => true,
    force   => true,
    }
    file { ['/var/www',
		'/var/www/$servername', ]:
      ensure    => directory,
    }
    file { "/var/www/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/$servername/log":
    ensure    => directory,
    }
  } 
  elsif $::osfamily == 'Debian' {

    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { "/etc/apache2/sites-enabled/$servername.conf":
      ensure => 'link',
      target => "/etc/apache2/sites-available/$servername.conf",
    }
    file { "/var/www/$servername/public_html/index.php":
    path    => "/var/www/$servername/public_html/index.php",
    ensure  => file,
    source  => "puppet:///modules/apache/index.php"
}
    file { "/etc/apache2/sites-enabled/000-default.conf":
    ensure  => 'absent',
    purge   => true,
    force   => true,
    }
    file { "/var/www/$servername":
      ensure    => directory,
    }
    file { "/var/www/$servername/public_html":
      ensure    => directory,
    }
    file { "/var/www/$servername/logs":
      ensure    => directory,
    }
  } else {
    print "This is not a supported distro."    
  }
        
}
