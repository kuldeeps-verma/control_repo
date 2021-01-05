node default {
  file { '/root/README':
    ensure => file,
    content => 'This is a readme',
    owner   => 'root',
  }
}
node 'master.puppet.vm' {
  include role::master_server
}

node 'node.pupper.vm' {
   package { 'httpd':
     ensure => present,
     name   => httpd,
   }
   
   service { 'httpd':
     ensure => running,
     name   => httpd,
     enable => true,
   }   
}
