# == Class: grafana::install
#
# This class downloads and installs grafana.
# SHOULD NOT be called directly.
#
# === Parameters
#
# None.
#
class grafana::install {
  if $::grafana::pkgsource == 'pkg' {
    $real_version  = regsubst($grafana::version, '.[a-zA-z]+-([a-zA-Z]\d+)', '')
    exec {
      'Download Grafana':
        command => "curl -s -L ${::grafana::package_base}/grafana-${::grafana::version}.tar.gz | tar xz",
        cwd     => $::grafana::install_dir,
        creates => "${::grafana::install_dir}/grafana-${real_version}",
    }->
    file {
      "${::grafana::install_dir}/grafana":
        ensure => link,
        target => "${::grafana::install_dir}/grafana-${real_version}",
    }
  } elsif $::grafana::pkgsource == 'yum' {
    package { 'grafana-server':
      ensure => present,
    }
  }
}
