# Backups

## Get backups

Todoist creates a backup archive of users' data on a daily
basis. Backup archives can also be accessed from the web app (`Todoist
Settings` -> `Backups`).

> The list of recent backup archives can be accessed via the following
> API endpoint, and upon successful request, a HTTP 200 response will
> be returned with a list of backup archives in JSON format:


```shell
$ curl https://todoist.com/api/v8/backups/get \
    -d token=0123456789abcdef0123456789abcdef01234567

[
  {
    "version": "2018-07-13 02:03",
    "url": "https://downloads.todoist.com/12345678901234567890123456789012.zip"
  },
    ...
]
```

```python
>>> import todoist
>>> api = todoist.TodoistAPI('0123456789abcdef0123456789abcdef01234567')
>>> api.backups.get()
[
  {
    'version': '2018-07-13 02:03',
    'url': 'https://downloads.todoist.com/12345678901234567890123456789012.zip'
  },
  ...
]
```

## Download the backup

[Get backups](#get-backups) will retrieve a list of downloadable files for the
user related to the token being used. To download one of the files returned,
you have to **use the token as a header**.


```shell
$ curl -L -H "Authorization: Bearer 0123456789abcdef0123456789abcdef01234567" \
    https://downloads.todoist.com/12345678901234567890123456789012.zip > /tmp/todoist-backup.zip
```
