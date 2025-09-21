## Execution Github Backup with nfs

- **prepare scripts | add following backup script from below link**\
https://github.com/saifulislam88/scripts/blob/main/gitlab-backup/gitlab-backup.sh

```sh 
vim /var/opt/git-backup.sh
```         

```sh
chmod +x /var/opt/git-backup.sh
```
- **nfs mount**

```sh
mount -t nfs 10.192.192.200:/github-backup /var/opt/gitlab/backups
```

- **cron setup for backup script execution**
```sh
crontab  -e
```
- **add schedule line or modify**
```sh
01 00 * * * /var/opt/git-backup.sh
```
