# ROR-CLI repo
class profile::ror_cli {
    file { '/usr/local/sbin/git-sync-ror-cli':
        ensure => file,
        owner => root,
        group => root,
        mode => '0755',
        content => template('profile/git-sync-ror-cli.sh'),
    }
}
