# LetsEncryptVagrant
A quick little setup cradle for testing Let's Encrypt

We want to be able to create scripts that create certificates, then install them under Nginx for the production server, or install them into AWS for our CloudFront configurations

Requirements
------------
You need to have VirtualBox installed, obvs. Everything else is inside the VM. 

Installation
------------
Super simple, we just launch a VM using:

```
vagrant up
```

Any issue can probably be fixed with a quick ```vagrant provision```

Then ssh into the box ```vagrant ssh```

Configure 

