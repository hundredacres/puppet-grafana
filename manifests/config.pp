# == Class: grafana::config
#
# This configures the config.js of grafana.
# SHOULD NOT be called directly.
#
# === Parameters
#
# None.
#
class grafana::config {
  file { "${::grafana::install_dir}/${::grafana::config_file}":
      ensure  => file,
      content => template($::grafana::config_tmpl),
  }
}
