# package { "ripgrep":
#     ensure => installed,
# }
class profile::foobarservice (
  String $package_name = 'ripgrep',
) {
  package { $package_name:
    ensure => installed,
  }
}
