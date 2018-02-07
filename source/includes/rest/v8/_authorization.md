# Authorization

> Authenticated request and response examples

```shell
$ curl -X GET \
  https://beta.todoist.com/API/v8/projects \
  -H "Authorization: Bearer $token"

[
    {
        "id": 1234,
        "name": "Inbox",
        "comment_count": 0
    }
]
```

```python
import requests
requests.get("https://beta.todoist.com/API/v8/projects", headers{"Authorization': 'Bearer %s" % your_token}).json()

[{u'comment_count': 0, u'id': 1234, u'name': u'Inbox'}]
```

API endpoints accept GET arguments as `url-encoded` values. Every endpoint
requires an [authorization header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) with the appropriate `Bearer $token` that holds the
[Todoist personal API token](https://todoist.com/Users/viewPrefs?page=integrations) or
[OAuth API token](https://developer.todoist.com/sync/v7/#oauth).

Note that we're using `$token` on all of our `curl` examples, so you
can define a temporary environment variable containing your token and
easily copy & paste `curl` commands into your terminal.
