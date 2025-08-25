class profile::basetest2 {
  file { '/etc/basetest2.txt':
    ensure  => present,
    content => lookup('basetest2_content', {default_value => 'default content from class'}),
  }
}
