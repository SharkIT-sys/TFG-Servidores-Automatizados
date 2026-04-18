Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64" # Ubuntu 22.04 LTS (o jammy64 para 24.04 cuando esté estable)

  # --- CONFIGURACIÓN SERVIDOR DNS ---
  config.vm.define "dns_server" do |dns|
    dns.vm.hostname = "dns-server"
    dns.vm.network "private_network", ip: "192.168.1.111"
    dns.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    dns.vm.provision "shell", path: "scripts/reiniciar_dns.sh"
  end

  # --- CONFIGURACIÓN SERVIDOR DHCP ---
  config.vm.define "dhcp_server" do |dhcp|
    dhcp.vm.hostname = "dhcp-server"
    dhcp.vm.network "private_network", ip: "192.168.1.112"
    dhcp.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    dhcp.vm.provision "shell", path: "scripts/backup_dhcpd.sh"
  end

  # --- CONFIGURACIÓN SERVIDOR WEB/SAMBA ---
  config.vm.define "web_server" do |web|
    web.vm.hostname = "web-server"
    web.vm.network "private_network", ip: "192.168.1.114"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end

  # --- CLIENTES ---
  (1..2).each do |i|
    config.vm.define "client_#{i}" do |client|
      client.vm.box = "debian/bullseye64"
      client.vm.hostname = "client-#{i}"
      client.vm.network "private_network", type: "dhcp"
    end
  end
end
