class profile::basetest {
  file { '/etc/base_profile_test':
    ensure  => 'present',
    content => "This file was created by profile::basetest!",
  }
  # Add other base resources as needed (packages, etc.)
}
