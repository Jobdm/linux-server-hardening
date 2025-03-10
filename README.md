<h1>Linux Server Setup & Hardening</h1>

<h2>Overview</h2>
<p align="left">
This project provides a step-by-step guide to setting up and securing a Linux server using industry best practices. It includes automation scripts to implement security measures efficiently. The goal is to reduce attack surfaces, enhance system integrity, and improve overall security posture.
</p>

<h2>Features Implemented</h2>

✅ User & Group Management (disable root login, create a sudo user)

✅ SSH Hardening (disable password authentication, change default port)

✅ Firewall Configuration (UFW/iptables to allow only necessary traffic)

✅ Fail2Ban Setup (protection against brute-force attacks)

✅ Automatic Security Updates (ensure patches are always applied)

✅ File & Directory Permissions (secure key system files)

✅ Intrusion Detection System (IDS) (AIDE for file integrity monitoring)

✅ System Auditing & Logging (Lynis, Auditd, journald for security logs)

<h2>Tech Stack</h2>

- OS: Ubuntu 24.04
- Security Tools: UFW, iptables, Fail2Ban, Lynis, Auditd, AIDE 
- Automation: Bash & Ansible scripts 

<h2>Prerequisites</h2>
<b>Before running the scripts, ensure:</b>

- You have a fresh Linux server instance 
- You are logged in as a non-root user with sudo privileges 
- You have git, curl, and ufw installed

<h2>Installation & Usage</h2>

<h3>1️⃣ Clone the repository</h3>

```sh
git clone https://github.com/jobdm/linux-server-hardening.git
cd linux-server-hardening
```

<h3>2️⃣ Run the setup script</h3>

```sh
chmod +x setup.sh
sudo ./setup.sh
```
<h3>3️⃣ Verify the hardening measures</h3>

```sh
sudo lynis audit system
```

<h2>Security Enhancements Applied</h2>

| Features | Descriptions | Status |
| --------| -------------| ------|
|`SSH Hardening` | Disabled root login, changed port, enabled key authentication | ✅
|`Firewall` | UFW configured to allow only essential traffic | ✅
|`Fail2Ban` | Installed & configured to block brute-force attempts | ✅
|`Automatic Updates` | Enabled automatic security patching | ✅
|`File Integrity Monitoring` | AIDE installed to monitor changes | ✅

<h2>Screenshots</h2>

- <b>Before Hardening</b>
(Example of open ports before firewall setup)

- <b>After Hardening</b>
(Locked down services & configured firewall)
