class sysprep {

  file { '/etc/sysconfig/iptables':
    source => 'puppet:///modules/bucket/etc/sysconfig/iptables',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/root/glassfish-answerfile':
    source => 'puppet:///modules/bucket/root/glassfish-answerfile',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/root/glassfish-install.sh':
    source => 'puppet:///modules/bucket/root/glassfish-install.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  service { 'iptables':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/sysconfig/iptables'],
  }

  service { 'postfix':
    ensure    => running,
    enable    => true,
  }

}
