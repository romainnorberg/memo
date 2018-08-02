# Vagrant

## :bulb: Tips

### Forcing a date on your Vagrant box (https://leftontheweb.com/blog/2013/10/08/Forcing-a-date-on-your-vagrant-box/)
```
...
  config.vm.provider "virtualbox" do |vb|
    ...

    vb.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 1]
  end
...
```

You can now force date `sudo date -s "2 AUG 2018 08:51:00"`
