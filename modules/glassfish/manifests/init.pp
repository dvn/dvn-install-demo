class glassfish {

  exec { "install_glassfish":
    command => "/bin/bash /root/glassfish-install.sh",
    onlyif  => "/usr/bin/test ! -e /usr/local/glassfish3",
    timeout => 0,
  }

}
