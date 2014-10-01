class nfs::params {
  $portmap = $::osfamily? {
    Debian    => $::lsbdistcodename? {
      Wheezy  => 'rpcbind',
      Jessie  => 'rpcbind',
      default => 'portmap',
    },
    default   => 'portmap'
  }
}
