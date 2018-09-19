#ol74-xe

This is simple oralce 11g xe data base installation on top of oracle linux 7.4

## use

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hellonuh/ol74-xe"
  config.vm.box_version = "0.0.1"
  config.vm.network :forwarded_port, guest: 1521, host: 1521
  config.vm.network :forwarded_port, guest: 8080, host: 8080
#   config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provider "virtualbox" do |v|
    v.name = "xedb"
    v.memory = 512
    v.cpus = 1
  end
end
```

To connect to db use 
- sqlplus system@localhost
- password is `oracle123`
- SQL> `EXEC DBMS_XDB.SETLISTENERLOCALACCESS(FALSE);`

Now do what you please