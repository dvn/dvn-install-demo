class downloads {

  exec { "download_dvn_zip":
    command => '/usr/bin/wget -O - http://sourceforge.net/projects/dvn/files/dvn/3.6/dvninstall_v3_6.zip/download > /root/dvninstall_v3_6.zip',
    onlyif  => "/bin/touch /root/dvninstall_v3_6.zip && /usr/bin/test `/usr/bin/md5sum /root/dvninstall_v3_6.zip | cut -d' ' -f1` != 'b740fedf925cd8d1e56c6e4f3d4c9a27'",
    timeout => 0,
  }

}
