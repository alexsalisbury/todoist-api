# Comments

> Comment object sample

```shell
{
    "attachment": {
        "file_name": "File.pdf",
        "file_type": "application/pdf",
        "file_url": "https://cdn-domain.tld/path/to/file.pdf",
        "resource_type": "file"
    },
    "content": "Hello world",
    "id": 1234,
    "posted": "2016-09-22T07:00:00Z",
    "project_id": 2345,
    "task_id": 2345
}
```

```python
{
    "attachment": {
        "file_name": "File.pdf",
        "file_type": "application/pdf",
        "file_url": "https://cdn-domain.tld/path/to/file.pdf",
        "resource_type": "file"
    },
    "content": "Hello world",
    "id": 1234,
    "posted": "2016-09-22T07:00:00Z",
    "project_id": 2345,
    "task_id": 2345
}
```

### Properties

| Property              | Description                                                                                         |
| --------------------- | --------------------------------------------------------------------------------------------------- |
| id _Integer_          | Comment id                                                                                          |
| task*id \_Integer*    | Comment's task id (for task comments).                                                              |
| project*id \_Integer* | Comment's project id (for project comments)                                                         |
| posted _String_       | Date and time when comment was added, [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) format in UTC |
| content _String_      | Comment content                                                                                     |
| attachment _Object_   | Attachment file (optional)                                                                          |

The optional attachment attribute describes object with attachment
metadata. Format of this object depends on kind of attachment it describes,
see [sync API documentation for format details](https://developer.todoist.com/sync/v7#uploads).

## Get all comments

> Get all comments

```shell
$ curl "https://beta.todoist.com/API/v8/comments?task_id=2345" \
  -H "Authorization: Bearer $token”

[
    {
        "id": 123,
        "task_id": 2345,
        "content": "Hello world",
        "posted": "2016-09-22T07:00:00Z",
        "attachment": {
            "resource_type": "file",
            "file_url": "https://cdn-domain.tld/path/to/file.pdf",
            "file_type": "application/pdf",
            "file_name": "File.pdf"
        }
    }
]
```

```python
import requests
requests.get(
    "https://beta.todoist.com/API/v8/comments",
    params={
        "task_id": 2345
    },
    headers={
        "Authorization": "Bearer %s" % your_token
    }).json()

[
    {
        "id": 123,
        "task_id": 2345,
        "content": "Hello world",
        "posted": "2016-09-22T07:00:00Z",
        "attachment": {
            "resource_type": "file",
            "file_url": "https://cdn-domain.tld/path/to/file.pdf",
            "file_type": "application/pdf",
            "file_name": "File.pdf"
        }
    }
]
```

Returns JSON-encoded array of all comments for a given `task_id` or
`project_id`. Note that one of `task_id` or `project_id` arguments is
required.

### Parameters

| Parameter             | Required              | Description                               |
| --------------------- | --------------------- | ----------------------------------------- |
| project*id \_Integer* | Yes (or `task_id`)    | Id of the project used to filter comments |
| task*id \_Integer*    | Yes (or `project_id`) | Id of the task used to filter comments    |

**Note**: You **must** use at least one of them

## Create a new comment

> Create a new comment

```shell
$ cat > /tmp/note.json
{
    "task_id": 2345,
    "content": "Hello world",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
^C

$ curl "https://beta.todoist.com/API/v8/comments" \
    -X POST \
    --data @/tmp/note.json \
    -H "Content-Type: application/json" \
    -H "X-Request-Id: $(uuidgen)" \
    -H "Authorization: Bearer $token”

{
    "id": 123,
    "content": "Hello world",
    "task_id": 2345,
    "posted": "2016-09-22T07:00:00Z",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
```

```python
import requests
requests.post(
    "https://beta.todoist.com/API/v8/comments",
    data=json.dumps({
        "task_id": 2248549994,
        "content": "Hello world",
        "attachment": {
            "resource_type":
            "file",
            "file_url":"https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
            "file_type":
            "application/pdf",
            "file_name":
            "File.pdf"
        }
    }),
    headers={
        "Content-Type": "application/json",
        "X-Request-Id": str(uuid.uuid4()),
        "Authorization": "Bearer %s" % your_token
    }).json()

{
    "id": 123,
    "content": "Hello world",
    "task_id": 2345,
    "posted": "2016-09-22T07:00:00Z",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
```

Creates a new comment on a project or task and returns its object

### JSON body parameters

| Parameter             | Required              | Description                                 |
| --------------------- | --------------------- | ------------------------------------------- |
| task*id \_Integer*    | Yes (or `project_id`) | Comment's task id (for task comments).      |
| project*id \_Integer* | Yes (or `task_id`)    | Comment's project id (for project comments) |
| content _String_      | Yes                   | Comment content                             |
| attachment _Object_   | No                    | Object for attachment object                |

## Get a comment

> Get a comment

```shell
$ curl "https://beta.todoist.com/API/v8/comments/1234" \
  -H "Authorization: Bearer $token”

{
    "id": 1234,
    "content": "Hello world",
    "task_id": 2345,
    "posted": "2016-09-22T07:00:00Z",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://cdn-domain.tld/path/to/file.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
```

```python
import requests
requests.get(
    "https://beta.todoist.com/API/v8/comments/1234",
    headers={
        "Authorization": "Bearer %s" % your_token
    }).json()


{
    "id": 1234,
    "content": "Hello world",
    "task_id": 2345,
    "posted": "2016-09-22T07:00:00Z",
    "attachment": {
        "resource_type": "file",
        "file_url": "https://cdn-domain.tld/path/to/file.pdf",
        "file_type": "application/pdf",
        "file_name": "File.pdf"
    }
}
```

Returns a comment by id

## Update a comment

> Update a comment

```shell
$ curl "https://beta.todoist.com/API/v8/comments/1234" \
    -X POST \
    --data '{"content": "Goodbye world"}' \
    -H "Content-Type: application/json" \
    -H "X-Request-Id: $(uuidgen)" \
    -H "Authorization: Bearer $token”
```

```python
import requests
requests.post(
    "https://beta.todoist.com/API/v8/comments/1234",
    data=json.dumps({
        "content": "Goodbye world"
    }),
    headers={
        "Content-Type": "application/json",
        "X-Request-Id": str(uuid.uuid4()),
        "Authorization": "Bearer %s" % your_token
    })
```

Updates a comment and returns an empty body with a HTTP status code 204

### JSON body parameters

| Parameter        | Required | Description                 |
| ---------------- | -------- | --------------------------- |
| content _String_ | Yes      | New content for the comment |

## Delete a comment

> Delete a comment

```shell
$ curl -X DELETE "https://beta.todoist.com/API/v8/comments/1234" \
    -H "Authorization: Bearer $token”
```

```python
import requests
requests.delete(
    "https://beta.todoist.com/API/v8/comments/1234",
    headers={
        "Authorization": "Bearer %s" % your_token
    })
```

Deletes a comment and returns an empty body with a HTTP status code 204
