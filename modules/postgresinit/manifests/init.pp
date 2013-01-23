class postgresinit {

  exec { "postgres_init":
    command => '/sbin/service postgresql initdb',
    onlyif  => "/usr/bin/test ! -e /var/lib/pgsql/data/PG_VERSION",
  }

}
