## Execution Github Backup with nfs

- **prepare scripts**\
https://github.com/saifulislam88/scripts/blob/main/gitlab-backup/gitlab-backup.sh\
`vim /var/opt/git-backup.sh`             #add backup bash-script here

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

```sh
01 00 * * * /var/opt/git-backup.sh
```
