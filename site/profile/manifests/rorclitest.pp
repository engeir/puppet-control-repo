# ROR-CLI repo
class profile::rorclitest (
    Variant[String[1],Integer[0,59]] $cron_minute = '0',
    Variant[String[1],Integer[0,59]] $cron_hour = '*',
){
    file { '/usr/local/sbin/git-sync-ror-cli':
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0755',
        content => epp('profile/git-sync-ror-cli.sh.epp', { install_dir => '/usr/local/bin' }),
    }

    file { '/etc/profile.d/localbin_path.sh':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => @(EOT)
if ! echo "$PATH" | grep -q "/usr/local/bin"; then
  export PATH="/usr/local/bin:$PATH"
fi
        | EOT
        }

    cron { 'git-sync-ror-cli':
        ensure =>'present',
        user=>'root',
        hour=>$cron_hour,
        minute=>$cron_minute,
        command =>'/usr/local/sbin/git-sync-ror-cli -q; echo "{ \"exit_code\": \"$?\" }"> /var/log/git-sync/state-ror-cli.json',
}
}
