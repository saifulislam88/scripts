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
- **Cron setup for backup script execution**

Edit crontab:
```sh
crontab -e

Add the following line (runs every day at 00:01):

01 00 * * * /var/opt/git-backup.sh
```
