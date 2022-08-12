# (WIP) sample-rhel8-overlay

Example InSpec profile overlay to validate the secure configuration of Red Hat Enterprise Linux 8 against DISA's Red Hat Enterprise Linux 8.x STIG.

## Getting Started  
It is intended and recommended that InSpec and this profile overlay be run from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __ssh__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment

The following inputs may be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
 - name: disable_slow_controls
    description: Controls that are known to consistently have long run times can be disabled with this attribute
    type: Boolean
    value: false

  #SV-230548
  - name: container_host
    description: Flag to designate if the target is a container host
    type: Boolean
    value: false

  # SV-230368
  - name: min_reuse_generations
    description: Number of reuse generations
    type: Numeric
    value: 5

  # SV-230369, SV-230370
  - name: min_len
    description: Minimum number of characters for a new password
    type: Numeric
    value: 15

  # SV-230234
  - name: grub_uefi_main_cfg
    description: Main grub boot config file
    type: String
    value: "/boot/efi/EFI/redhat/grub.cfg"

  - name: grub_uefi_user_boot_files
    description: Grub boot config files
    type: Array
    value: ["/boot/efi/EFI/redhat/user.cfg"]

  # SV-230317, SV-230321, SV-230322, SV-230325, SV-230328, SV-230309, SV-230320
  - name: exempt_home_users
    description: Users exempt from home directory-based controls in array format
    type: Array
    value: ["vagrant"]

  - name: non_interactive_shells
    description: These shells do not allow a user to login
    type: Array
    value:
      - "/sbin/nologin"
      - "/sbin/halt"
      - "/sbin/shutdown"
      - "/bin/false"
      - "/bin/sync"
      - "/bin/true"

  # SV-230379
  - name: known_system_accounts
    description: System accounts that support approved system activities.
    type: Array
    value:
      - "root"
      - "bin"
      - "daemon"
      - "adm"
      - "lp"
      - "sync"
      - "shutdown"
      - "halt"
      - "mail"
      - "operator"
      - "nobody"
      - "systemd-bus-proxy"
      - "dbus"
      - "polkitd"
      - "postfix"
      - "sssd"
      - "chrony"
      - "systemd-network"
      - "sshd"
      - "ntp"

  - name: user_accounts
    description: Accounts of known managed users
    type: Array
    value: ["vagrant"]

  # SV-230379
  - name: log_pkg_path
    description: The path to the logging package
    type: String
    value: "/etc/rsyslog.conf"

  # SV-230235
  - name: grub_main_cfg
    description: Main grub boot config file
    type: String
    value: "/boot/grub2/grub.cfg"

  - name: grub_user_boot_files
    description: Grub boot config files
    type: Array
    value:
      - "/boot/grub2/user.cfg"

  # SV-230537
  - name: ipv4_enabled
    description: Set to 'true' if IPv4 is enabled on the system.
    type: Boolean
    value: true

  # SV-230537
  - name: ipv6_enabled
    description: Set to 'true' if IPv6 is enabled on the system.
    type: Boolean
    value: true

  # SV-230493
  - name: camera_installed
    description: Device or system does not have a camera installed.
    type: Boolean
    value: true

  # SV-230503
  - name: bluetooth_installed
    description: 'Device or operating system has a Bluetooth adapter installed'
    type: Boolean
    value: true

  # SV-230242
  - name: known_system_accounts
    description: System accounts that support approved system activities.
    type: Array
    value: 
      - 'root'
      - 'bin'
      - 'daemon'
      - 'adm'
      - 'lp'
      - 'sync'
      - 'shutdown'
      - 'halt'
      - 'mail'
      - 'operator'
      - 'nobody'
      - 'systemd-bus-proxy'
      - 'dbus'
      - 'polkitd'
      - 'postfix'
      - 'sssd'
      - 'chrony'
      - 'systemd-network'
      - 'sshd'
      - 'ntp'

  - name: smart_card_status
    description: Smart card status (enabled or disabled)
    type: String
    value: 'enabled'

  # SV-230263
  - name: file_integrity_tool
    description: Name of tool
    type: String
    value: 'aide'
  # SV-230484
  - name: authoritative_timeserver
    description: Timeserver used in /etc/chrony.conf
    type: String
    value: 0.us.pool.ntp.mil

  # SV-230537
  - name: non_removable_media_fs
    description: File systems listed in /etc/fstab which are not removable media devices
    type: Array
    value: ["/", "/tmp", "none", "/home"]

  # SV-230230
  - name: private_key_files
    description: List of full paths to private key files on the system
    type: Array
    value: []

  #SV-230229
  - name: root_ca_file
    description: Path to an accepted trust anchor certificate file (DoD)
    type: String
    value: "/etc/sssd/pki/sssd_auth_ca_db.pem"

  #SV-230333
  - name: unsuccessful_attempts
    description: Maximum number of unsuccessful attempts before lockout
    type: Numeric
    value: 3

  #SV-230353
  - name: system_inactivity_timeout
    description: Maximum system inactivity timeout (time in seconds).
    type: Numeric
    value: 900

  #SV-230356
  - name: max_retry
    description: Maximum number of retry attempts for login
    type: Numeric
    value: 3

  #SV-230363
  - name: difok
    description: Minimum number of characters that must be different from previous password
    type: Numeric
    value: 8

  #SV-230373
  - name: days_of_inactivity
    description: Maximum number of days if account inactivity before account lockout
    type: Numeric
    value: 35

  - name: temporary_accounts
    description: Temporary user accounts
    type: Array
    value: []

  - name: banner_message_text_cli
    description: Banner message text for command line interface logins.
    type: String
    value: "You are accessing a U.S. Government (USG) Information System (IS) that is \
    provided for USG-authorized use only. By using this IS (which includes any \
    device attached to this IS), you consent to the following conditions: -The USG \
    routinely intercepts and monitors communications on this IS for purposes \
    including, but not limited to, penetration testing, COMSEC monitoring, network \
    operations and defense, personnel misconduct (PM), law enforcement (LE), and \
    counterintelligence (CI) investigations. -At any time, the USG may inspect and \
    seize data stored on this IS. -Communications using, or data stored on, this \
    IS are not private, are subject to routine monitoring, interception, and \
    search, and may be disclosed or used for any USG-authorized purpose. -This IS \
    includes security measures (e.g., authentication and access controls) to \
    protect USG interests--not for your personal benefit or privacy. \
    -Notwithstanding the above, using this IS does not constitute consent to PM, \
    LE or CI investigative searching or monitoring of the content of privileged \
    communications, or work product, related to personal representation or \
    services by attorneys, psychotherapists, or clergy, and their assistants. Such \
    communications and work product are private and confidential. See User \
    Agreement for details."


  - name: banner_message_text_ral
    description: Banner message text for remote access logins.
    type: String
    value: "You are accessing a U.S. Government (USG) Information System (IS) that is \
    provided for USG-authorized use only. By using this IS (which includes any \
    device attached to this IS), you consent to the following conditions: -The USG \
    routinely intercepts and monitors communications on this IS for purposes \
    including, but not limited to, penetration testing, COMSEC monitoring, network \
    operations and defense, personnel misconduct (PM), law enforcement (LE), and \
    counterintelligence (CI) investigations. -At any time, the USG may inspect and \
    seize data stored on this IS. -Communications using, or data stored on, this \
    IS are not private, are subject to routine monitoring, interception, and \
    search, and may be disclosed or used for any USG-authorized purpose. -This IS \
    includes security measures (e.g., authentication and access controls) to \
    protect USG interests--not for your personal benefit or privacy. \
    -Notwithstanding the above, using this IS does not constitute consent to PM, \
    LE or CI investigative searching or monitoring of the content of privileged \
    communications, or work product, related to personal representation or \
    services by attorneys, psychotherapists, or clergy, and their assistants. Such \
    communications and work product are private and confidential. See User \
    Agreement for details."

  - name: banner_message_text_gui
    description: Banner message text for graphical user interface logins.
    type: String
    value: "You are accessing a U.S. Government (USG) Information System (IS) that is \
    provided for USG-authorized use only. By using this IS (which includes any \
    device attached to this IS), you consent to the following conditions: -The USG \
    routinely intercepts and monitors communications on this IS for purposes \
    including, but not limited to, penetration testing, COMSEC monitoring, network \
    operations and defense, personnel misconduct (PM), law enforcement (LE), and \
    counterintelligence (CI) investigations. -At any time, the USG may inspect and \
    seize data stored on this IS. -Communications using, or data stored on, this \
    IS are not private, are subject to routine monitoring, interception, and \
    search, and may be disclosed or used for any USG-authorized purpose. -This IS \
    includes security measures (e.g., authentication and access controls) to \
    protect USG interests--not for your personal benefit or privacy. \
    -Notwithstanding the above, using this IS does not constitute consent to PM, \
    LE or CI investigative searching or monitoring of the content of privileged \
    communications, or work product, related to personal representation or \
    services by attorneys, psychotherapists, or clergy, and their assistants. Such \
    communications and work product are private and confidential. See User \
    Agreement for details."

  - name: maxlogins_limit
    description: Amount of max logins allowed
    type: String
    value: '10'

  - name: unsuccessful_attempts
    description: number of unsuccessful attempts
    type: Numeric
    value: 3

  - name: fail_interval
    description: Interval of time in which the consecutive failed logon attempts must occur in order for the account to be locked out (time in seconds)
    type: Numeric
    value: 900

  - name: lockout_time
    description: Minimum amount of time account must be locked out after failed logins. This attribute should never be set greater than 604800 (time in seconds).
    type: Numeric
    value: 604800

  - name: log_directory
    description: Documented tally log directory
    type: String
    value: '/var/log/faillock'
```

## Running This Overlay Directly from Github

Against a remote target using ssh with escalated privileges (i.e., InSpec installed on a separate runner host)
```bash
# How to run 
inspec exec https://github.com/mitre/sample-rhel8-overlay/archive/main.tar.gz -t ssh://TARGET_USERNAME:TARGET_PASSWORD@TARGET_IP:TARGET_PORT --sudo --sudo-password=<SUDO_PASSWORD_IF_REQUIRED> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

Against a remote target using a pem key with escalated privileges (i.e., InSpec installed on a separate runner host)
```bash
# How to run 
inspec exec https://github.com/mitre/sample-rhel8-overlay/archive/main.tar.gz -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>  
```

Against a local Red Hat host with escalated privileges (i.e., InSpec installed on the target)
```bash
# How to run
sudo inspec exec https://github.com/mitre/sample-rhel8-overlay/archive/main.tar.gz --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```
### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy
If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.) 

```
mkdir profiles
cd profiles
git clone https://github.com/mitre/sample-rhel8-overlay.git
inspec archive sample-rhel8-overlay
sudo inspec exec <name of generated archive> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd sample-rhel8-overlay
git pull
cd ..
inspec archive sample-rhel8-overlay --overwrite
sudo inspec exec <name of generated archive> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors


## Special Thanks
* Eugene Aronne

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/mitre/sample-rhel8-overlay/issues/new).

## License
This is licensed under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) license. 

### NOTICE
DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx