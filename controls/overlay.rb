overlay_controls = input('overlay_controls')
system_categorization = input('system_categorization')

include_controls 'redhat-enterprise-linux-8-stig-baseline' do

    control 'SV-230221' do
        tag nist: ['CM-6']
    end

    control 'SV-230255' do
        impact 0.0
        desc "caveat", 'Not applicable for this ACME corporation' do
            skip 'Not applicable for this ACME corporation'
        end
    end

    control 'SV-230312' do
        describe "A manual review is required to verify the operating system is not configured to acquire, save, or process core dumps. If it is then this is a finding." do	
         skip "A manual review is required to verify the operating system is not configured to acquire, save, or process core dumps. If it is then this is a finding."	
        end
    end

    control 'SV-230353' do
        title "RHEL 8 must automatically lock command line user sessions after 20
minutes of inactivity."
        desc  'check', "
    Verify the operating system initiates a session lock after 15 minutes of
inactivity.
    Check the value of the system inactivity timeout with the following command:
    $ sudo grep -i lock-after-time /etc/tmux.conf
    set -g lock-after-time 1200
    If \"lock-after-time\" is not set to \"1200\" or less in the global tmux
configuration file to enforce session lock after inactivity, this is a finding.
  "
  desc 'fix', "
    Configure the operating system to enforce session lock after a period of 15
minutes of inactivity by adding the following line to the \"/etc/tmux.conf\"
global configuration file:
    set -g lock-after-time 1200
  "
    end

end