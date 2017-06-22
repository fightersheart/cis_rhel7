class cis_rhel7::rule::rule_7_1_1 {
  #includes Rules:
  # 7.1.1 - Set Password Expiration Days (Scored)
  # 7.1.2 - Set Password Change Minimum Number of Days (Scored)
  # 7.1.3 - Set Password Expiring Warning Days (Scored)

  $file = '/etc/login.defs'

  file { "(7.1.1) - ${file} exists":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { '(7.1.1) - Set password expiration date':
    ensure  => present,
    path    => $file,
    line    => 'PASS_MAX_DAYS 90',
    match   => '^PASS_MAX_DAYS.*',
    replace => true,
  }

  # For BNS PASS_MIN_DAYS is 1
  file_line { '(7.1.2) - Set password change minimum number of days':
    ensure  => present,
    path    => $file,
    line    => 'PASS_MIN_DAYS 1',
    match   => '^PASS_MIN_DAYS',
    replace => true,
  }

  # For BNS PASS_WARN_AGE is 10
  file_line { '(7.1.3) - Set password expiring warning days':
    ensure  => present,
    path    => $file,
    line    => 'PASS_WARN_AGE 10',
    match   => '^PASS_WARN_AGE',
    replace => true,
  }

} #EOF
