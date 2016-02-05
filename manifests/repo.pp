class grafana::repo {
  include ::packagecloud

  packagecloud::repo { 'grafana/stable':
    type => 'rpm',  # or "deb" or "gem"
  }
}
