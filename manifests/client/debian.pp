class nfs::client::debian inherits nfs::base {

  package { "nfs-common":
    ensure => present,
  }

  if $lsbdistcodename != "wheezy" {
    package { "portmap":
      ensure => present,
    }
  }

  service { "nfs-common":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Package["nfs-common"],
  }

  if $lsbdistcodename != "wheezy" {
    service { "portmap":
      ensure    => running,
      enable    => true,
      hasstatus => false,
      require   => Package["portmap"],
    }
  }
}
