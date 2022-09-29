# sample-rhel8-overlay

Sample overlay for the baseline InSpec profile at https://github.com/CMSgov/redhat-enterprise-linux-8-stig-baseline with modifications based Our Project's different policy compliance baseline requirements. The baseline InSpec profile is used validate the secure configuration of Red Hat Enterprise Linux 8 against DISA's Red Hat Enterprise Linux 8.x STIG.

The original baseline InSpec profile is used validate the secure configuration of Red Hat Enterprise Linux 8 against DISA's Red Hat Enterprise Linux 8.x STIG exactly against the requirements in DISA's Red Hat Enterprise Linux 8.x STIG.

This Overlay profile clearly distinguishes and measures to OUR policy requirements without modification to the baseline profile or misrepresentation that we are exactly compliant with the original STIG. This overlay allows us to show compliance with our own vetted requirements.

## Getting Started  
It is intended and recommended that InSpec and this profile overlay be run from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __ssh__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment

The following inputs may be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
# Used by InSpec check SV-230309
# InSpec Tests that are known to consistently have long run times can be disabled with this attribute
# Description: Controls that are known to consistently have long run times can be disabled with this attribute
# Type: Boolean
# (default value): false
disable_slow_controls: 

# Used by InSpec check SV-230548
# Description: Flag to designate if the target is a container host
# Type: Boolean
# (default value): false
container_host:

# Used by InSpec check SV-230234
# Description: Main grub boot config file
# Type: String
# (default value): "/boot/efi/EFI/redhat/grub.cfg"
grub_uefi_main_cfg:

# Used by InSpec check SV-230234
# Description: Grub boot config files
# Type: Array
# (default value): ["/boot/efi/EFI/redhat/user.cfg"]
grub_uefi_user_boot_files: []

# Used by InSpec check SV-230317, SV-230321, SV-230322, SV-230325, SV-230328, SV-230309, SV-230320
# Description: Users exempt from home directory-based controls in array format
# Type: Array
# (default value): ["vagrant"]
exempt_home_users: []

# Used by InSpec check SV-230317, SV-230321, SV-230322, SV-230325, SV-230328, SV-230309, SV-230320
# Description: These shells do not allow a user to login
# Type: Array
# (default value):
#      - "/sbin/nologin"
#      - "/sbin/halt"
#      - "/sbin/shutdown"
#      - "/bin/false"
#      - "/bin/sync"
#      - "/bin/true"
non_interactive_shells: []

# Used by InSpec check SV-230379
# Description: System accounts that support approved system activities.
# Type: Array
# (default value):
#      - "root"
#      - "bin"
#      - "daemon"
#      - "adm"
#      - "lp"
#      - "sync"
#      - "shutdown"
#      - "halt"
#      - "mail"
#      - "operator"
#      - "nobody"
#      - "systemd-bus-proxy"
#      - "dbus"
#      - "polkitd"
#      - "postfix"
#      - "sssd"
#      - "chrony"
#      - "systemd-network"
#      - "sshd"
#      - "ntp"
known_system_accounts: []

# Description: Accounts of known managed users
# Type: Array
# (default value): ["vagrant"]
user_accounts: []

# Used by InSpec check SV-230379
# Description: The path to the logging package
# Type: String
# (default value): "/etc/rsyslog.conf"
log_pkg_path:

# Used by InSpec check SV-230235
# Description: Main grub boot config file
# Type: String
# (default value): "/boot/grub2/grub.cfg"
grub_main_cfg: 

# Description: Grub boot config files
# Type: Array
# (default value):["/boot/grub2/user.cfg"]
grub_user_boot_files: []

# Used by InSpec check SV-230537
# Description: Set to 'true' if IPv4 is enabled on the system.
# Type: Boolean
# (default value): true
ipv4_enabled:

# Used by InSpec check SV-230537
# Description: Set to 'true' if IPv6 is enabled on the system.
# Type: Boolean
# (default value): true
ipv6_enabled:

# Used by InSpec check SV-230493
# Description: Device or system does not have a camera installed.
# Type: Boolean
# (default value): true
camera_installed:

# Used by InSpec check SV-230503
# Description: 'Device or operating system has a Bluetooth adapter installed'
# Type: Boolean
# (default value): true
bluetooth_installed:

# Used by InSpec check SV-230242
# Description: System accounts that support approved system activities.
# Type: Array
# (default value): 
#      - 'root'
#      - 'bin'
#      - 'daemon'
#      - 'adm'
#      - 'lp'
#      - 'sync'
#      - 'shutdown'
#      - 'halt'
#      - 'mail'
#      - 'operator'
#      - 'nobody'
#      - 'systemd-bus-proxy'
#      - 'dbus'
#      - 'polkitd'
#      - 'postfix'
#      - 'sssd'
#      - 'chrony'
#      - 'systemd-network'
#      - 'sshd'
#      - 'ntp'
known_system_accounts: []

# Description: Smart card status (enabled or disabled)
# Type: String
# (default value): 'enabled'
smart_card_status: 

# Used by InSpec check SV-230263
# Description: Name of integrity checking tool
# Type: String
# (default value): 'aide'
file_integrity_tool: 

# Used by InSpec check SV-230484
# Description: Timeserver used in /etc/chrony.conf
# Type: String
# (default value): 0.us.pool.ntp.mil
authoritative_timeserver: 

# Used by InSpec check SV-230537
# Description: File systems listed in /etc/fstab which are not removable media devices
# Type: Array
# (default value): ["/", "/tmp", "none", "/home"]
non_removable_media_fs: []

# Used by InSpec check SV-230230
# Description: List of full paths to private key files on the system
# Type: Array
# (default value): []
private_key_files: []

# Used by InSpec check SV-230229
# Description: Path to an accepted trust anchor certificate file (DoD)
# Type: String
# (default value): "/etc/sssd/pki/sssd_auth_ca_db.pem"
root_ca_file: 

# Description: Temporary user accounts
# Type: Array
# (default value): []
temporary_accounts: []

# Description: Documented tally log directory
# Type: String
# (default value): '/var/log/faillock'
log_directory: 

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
* [Mohamed El-Sharkawi](https://github.com/HackerShark)

## Special Thanks
* [Eugene Aronne](https://github.com/ejaronne)

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/mitre/sample-rhel8-overlay/issues/new).

## License
This is licensed under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) license. 

### NOTICE
DISA STIGs are published at: https://public.cyber.mil/stigs/
