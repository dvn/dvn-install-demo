class downloads {

  exec { "download_dvn_zip":
    command => '/usr/bin/wget -O - http://sourceforge.net/projects/dvn/files/dvn/3.5.1/dvninstall_v3_5_1.zip/download > /root/dvninstall_v3_5_1.zip',
    onlyif  => "/bin/touch /root/dvninstall_v3_5_1.zip && /usr/bin/test `/usr/bin/md5sum /root/dvninstall_v3_5_1.zip | cut -d' ' -f1` != '49c84a8b90b5db7e5066b706e61084c2'",
    timeout => 0,
  }

}
