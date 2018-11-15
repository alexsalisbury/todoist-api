# User settings

> An example user settings object

```json
{
    "reminder_push": true,
    "reminder_sms": true,
    "reminder_desktop": true,
    "reminder_email": true
}
```

*These settings have effect only for Todoist Premium users.*

### Properties

Property | Description
-------- | -----------
reminder_push *Boolean* | Set to true to send reminders as push notifications
reminder_sms *Boolean* | Set to true to send reminders via SMS
reminder_desktop *Boolean* | Set to true to show reminders in desktop applications
reminder_email *Boolean* | Set to true to send reminders by email


## Update user settings

> An example of changing user settings:

```shell
$ curl https://todoist.com/api/v8/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "user_settings_update", "temp_id": "e24ad822-a0df-4b7d-840f-83a5424a484a", "uuid": "41e59a76-3430-4e44-92b9-09d114be0d49", "args": {"reminder_desktop": false}}]'

{
  ...
  "sync_status": {"41e59a76-3430-4e44-92b9-09d114be0d49": "ok"},
  ...
}
```

```python
>>> import todoist
>>> api = todoist.TodoistAPI('0123456789abcdef0123456789abcdef01234567')
>>> reminder = api.user_settings.update(reminder_desktop=False)
>>> api.commit()
```

Update one or more user settings.

### Command arguments

Argument | Required | Description
--------- | -------- | -----------
reminder_push *Boolean* | No | Set to true to send reminders as push notifications
reminder_sms *Boolean* | No | Set to true to send reminders via SMS
reminder_desktop *Boolean* | No | Set to true to show reminders in desktop applications
reminder_email *Boolean* | No | Set to true to send reminders by email
