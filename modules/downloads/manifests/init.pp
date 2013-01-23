class downloads {

  exec { "download_dvn_zip":
    command => '/usr/bin/wget -O - http://sourceforge.net/projects/dvn/files/dvn/3.3/dvninstall_v3_3.zip/download > /root/dvninstall_v3_3.zip',
    onlyif  => "/bin/touch /root/dvninstall_v3_3.zip && /usr/bin/test `/usr/bin/md5sum /root/dvninstall_v3_3.zip | cut -d' ' -f1` != '3418b7d024fa2bb2c1164f4ebf8bc91a'",
    timeout => 0,
  }

}
