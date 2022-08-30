include_controls 'redhat-enterprise-linux-8-stig-baseline' do

    control 'SV-230255' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.'
        describe 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.' do
          skip 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.'
        end
    end

    control 'SV-230368' do
          title "RHEL 8 passwords must be prohibited from reuse for a minimum of TWO
        generations."
          desc  'check', "
            Verify the operating system prohibits password reuse for a minimum of TWO
        generations.
            Check for the value of the \"remember\" argument in
        \"/etc/pam.d/system-auth\" and \"/etc/pam.d/password-auth\" with the following
        command:
            $ sudo grep -i remember /etc/pam.d/system-auth /etc/pam.d/password-auth
            password required pam_pwhistory.so use_authtok remember=2 retry=3
            If the line containing \"pam_pwhistory.so\" does not have the \"remember\"
        module argument set, is commented out, or the value of the \"remember\" module
        argument is set to less than \"2\", this is a finding.
          "
          desc 'fix', "
            Configure the operating system to prohibit password reuse for a minimum of
        TWO generations.
            Add the following line in \"/etc/pam.d/system-auth\" and
        \"/etc/pam.d/password-auth\" (or modify the line to have the required value):
            password required pam_pwhistory.so use_authtok remember=2 retry=3
          "    
    end
    
    control 'SV-230369' do
      title 'RHEL 8 passwords must have a minimum of 32 characters.'
      desc  'check', "
        Verify the operating system enforces a minimum 32-character password
    length. The \"minlen\" option sets the minimum number of characters in a new
    password.
        Check for the value of the \"minlen\" option in
    \"/etc/security/pwquality.conf\" with the following command:
        $ sudo grep minlen /etc/security/pwquality.conf
        minlen = 32
        If the command does not return a \"minlen\" value of 32 or greater, this is
    a finding.
      "
      desc 'fix', "
        Configure operating system to enforce a minimum 32-character password
    length.
        Add the following line to \"/etc/security/pwquality.conf\" (or modify the
    line to have the required value):
        minlen = 32
      "
    end
    
    control 'SV-230370' do
      title 'RHEL 8 passwords for new users must have a minimum of 32 characters.'
      desc  'check', "
        Verify that RHEL 8 enforces a minimum 32-character password length for new
    user accounts by running the following command:
        $ sudo grep -i  pass_min_len /etc/login.defs
        PASS_MIN_LEN 32
        If the \"PASS_MIN_LEN\" parameter value is less than \"32\", or commented
    out, this is a finding.
      "
      desc 'fix', "
        Configure operating system to enforce a minimum 32-character password
    length for new user accounts.
        Add, or modify the following line in the \"/etc/login.defs\" file:
        PASS_MIN_LEN 32
      "
    end
    
    control 'SV-230353' do
            title "RHEL 8 must automatically lock command line user sessions after 20
    minutes of inactivity."
            desc  'check', "
        Verify the operating system initiates a session lock after 20 minutes of
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
