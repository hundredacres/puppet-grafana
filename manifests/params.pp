class grafana::params {
  $manage_repo = true
  $pkgsource = undef

  $install_dir = $pkgsource ? {
    'yum'   => '/etc/grafana',
    'pkg'   => '/opt',
    default => '/etc/grafana',
  }
  $config_file = $pkgsource ? {
    'yum'   => 'grafana.ini',
    'pkg'   => 'grafana/config.js',
    default => 'grafana.ini',
  }
  $config_tmpl = $pkgsource ? {
    'yum'   => 'grafana/config.ini.erb',
    'pkg'   => 'grafana/config.js.erb',
    default => 'grafana/config.ini.erb',
  }
}
