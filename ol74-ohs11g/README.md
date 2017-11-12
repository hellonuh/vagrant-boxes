# ol74-ohs11g
This is a simple vagrant box with OHS 11g installed on top of Oracle linux 7.4 vagrant base image

## prerequisite
- vagrant installed on your machine
- virtualbox

If you want to know more about vagrant or virtual box you can google it. 
The process is quite straight forward.

## building the box
- Download the software mentioned in the software folder.
- Take a look at the `Vagrant` and `bootstrap.sh` file and make any changes your like
- `vagrant up`
- if everything goes fine you have your self a box
- `vagrant package --output mynew.box`
- `vagrant box add mynewbox mynew.box`
- `vagrant destroy`



## Just want to use this box
If you are only looking to use the box follow the below steps
- cd your_working_dir
- open cmd or terminal in this folder and type `vagrant init`
- open the Vagrant file that was generated and replace it with the below content

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hellonuh/ol74-ohs11g"
  config.vm.box_version = "0.0.1"
  config.vm.network :forwarded_port, guest: 7777, host: 10000
  config.vm.network :forwarded_port, guest: 4443, host: 10001
  # config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provider "virtualbox" do |v|
    v.name = "ohs"
    v.memory = 512
    v.cpus = 1
  end
end
```
- make any changes to suite your needs
- create a `bootstrap.sh` file and write the initial setup you want to do or just ssh into the box `vagrant ssh` and make the changes.

