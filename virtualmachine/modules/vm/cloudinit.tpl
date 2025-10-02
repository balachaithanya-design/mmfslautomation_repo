#cloud-config
ssh_pwauth: true

# -----------------------------
# Create users with passwords
# -----------------------------
users:
  - name: DataAnalytics
    plain_text_passwd: "Mahindra@321"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash

  - name: MF-100007953
    plain_text_passwd: "Mahindra@321"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash

  - name: MF-100007954
    plain_text_passwd: "Mahindra@321"
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash

runcmd:
  # -----------------------------
  # Update and install dependencies
  # -----------------------------
  - apt-get update -y
  - DEBIAN_FRONTEND=noninteractive apt-get install -y xrdp xfce4 xfce4-goodies ufw wget software-properties-common apt-transport-https gnupg wine64 firefox

  # -----------------------------
  # Enable and restart xrdp
  # -----------------------------
  - systemctl enable xrdp
  - systemctl restart xrdp

  # -----------------------------
  # Configure XFCE session for MF users
  # -----------------------------
  - echo xfce4-session > /home/MF-100007953/.xsession || true
  - chown MF-100007953:MF-100007953 /home/MF-100007953/.xsession || true
  - echo xfce4-session > /home/MF-100007954/.xsession || true
  - chown MF-100007954:MF-100007954 /home/MF-100007954/.xsession || true

  # -----------------------------
  # Install VS Code (optional)
  # -----------------------------
  - wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - || true
  - add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" || true
  - apt-get update -y || true
  - apt-get install -y code || true

  # -----------------------------
  # Optional: Notepad++ via Wine
  # -----------------------------
  - wget https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.6/Notepad++_8.4.6_x64_Setup.exe -O /tmp/Notepad++.exe
  - sudo -u MF-100007953 wine /tmp/Notepad++.exe || true
  - sudo -u MF-100007954 wine /tmp/Notepad++.exe || true

  # -----------------------------
  # Restart server services (optional)
  # -----------------------------
  - systemctl restart xrdp