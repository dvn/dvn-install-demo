stage { 'packages':  before  => Stage['main'] }

stage { 'downloads': require  => Stage['packages'] }

stage { 'postgresinit':  require => Stage['main'] }

stage { 'postgres':  require => Stage['postgresinit'] }

stage { 'glassfish':  require => Stage['postgres'] }

class {
    'packages':  stage => packages;
    'downloads': stage => downloads;
    'postgresinit':  stage => postgresinit;
    'postgres':  stage => postgres;
    'sysprep':       stage => main;
    'glassfish':       stage => glassfish;
}
