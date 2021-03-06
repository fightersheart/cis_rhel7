class cis_rhel7::rule::rule_2_1_1 (
  $removepackage = lookup({'name' => 'cis_rhel7::removepackage:', 'default_value' => {}, 'merge' => {'strategy' => 'deep', 'merge_hash_arrays' => true}}),
  $removeservice = lookup({'name' => 'cis_rhel7::removeservice:', 'default_value' => {}, 'merge' => {'strategy' => 'deep', 'merge_hash_arrays' => true}})
) {
  # includes Rules:
  # 2.1.1 - Remove telnet-server (Scored)
  # 2.1.2 - Remove telnet Clients (Scored)
  # 2.1.3 - Remove rsh-server (Scored)
  # 2.1.4 - Remove rsh (Scored)
  # 2.1.5 - Remove NIS Client (Scored)
  # 2.1.6 - Remove NIS Server (Scored)
  # 2.1.7 - Remove tftp (Scored)
  # 2.1.8 - Remove tftp-server (Scored)
  # 2.1.9 - Remove talk (Scored)
  # 2.1.10 - Remove talk-server (Scored)
  # 2.1.11 - Remove xinetd (Scored)
  # 2.1.12 - Disable chargen-dgram (Scored)
  # 2.1.13 - Disable chargen-stream (Scored)
  # 2.1.14 - Disable daytime-dgram (Scored)
  # 2.1.15 - Disable daytime-stream (Scored)
  # 2.1.16 - Disable echo-dgram (Scored)
  # 2.1.17 - Disable echo-stream (Scored)
  # 2.1.18 - Disable tcpmux-server (Scored)

  $removepackage.each |$package, $desc| {
    package { $desc:
      ensure => absent,
      name   => $package,
    }
  }

  $removeservice.each |$service, $desc| {
    service { $desc:
      ensure => stopped,
      name   => $service,
    }
  }

} #EOF
