chef-repo-nginx-php-fcgi
------------------------

This is a **experimental** chef repository.

## Required Tools

- Chef
- Knife
- Knife Zero
- Berkshelf

## Get started
### AWS EC2 (Amazon Linux AMI)

```
$ berks vendor cookbooks
$ knife zero bootstrap 87.65.43.21 -x ec2-user --sudo --hint ec2
$ knife node run_list add 87.65.43.21 "role[web]"
$ knife zero chef_client "name:*" --attribute ec2.public_ipv4 -x ec2-user --sudo -W # dry-run
$ knife zero chef_client "name:*" --attribute ec2.public_ipv4 -x ec2-user --sudo
```

Try to access by your browser.

## What is installed

- nginx
- PHP 5
- spawn-fcgi