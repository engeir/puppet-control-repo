# ROR-CLI repo
class profile::ror_cli (
    Variant[String[1],Integer[0,59]] $cron_minute = '*',
    Variant[String[1],Integer[0,59]] $cron_hour = '*',
){
    file { '/usr/local/sbin/git-sync-ror-cli':
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0755',
        content => template('profile/git-sync-ror-cli.sh'),
    }

    cron { 'git-sync-ror-cli':
        ensure =>'present',
        user=>'root',
        hour=>$cron_hour,
        minute=>$cron_minute,
        command =>'/usr/local/sbin/git-sync-ror-cli -q; echo "{ \"exit_code\": \"$?\" }"> /var/log/git-sync/state-ror-cli.json',
}
}
