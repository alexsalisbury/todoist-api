# Labels

> Label object sample

```shell
{
    "id": 1234,
    "name": "Project X",
    "order": 10
}
```

```python
{
    "id": 1234,
    "name": "Project X",
    "order": 10
}
```

### Properties

Property | Description
----------|------------
id *Integer* | Label id
name *String* | Label name
order *Integer* | Number used by clients to sort list of labels

## Get all labels

> Get all labels

```shell
$ curl "https://beta.todoist.com/API/v8/labels" \
    -H "Authorization: Bearer $token”

[
    {
        "id": 1234,
        "name": "Project X",
        "order": 10
    }
]
```

```python
import requests
requests.get(
    "https://beta.todoist.com/API/v8/labels",
    headers={
        "Authorization": "Bearer %s" % your_token
    }).json()


[
    {
        "id": 1234,
        "name": "Project X",
        "order": 10
    }
]
```

Returns a JSON-encoded array containing all user labels

## Create a new label

> Create a new label

```shell
$ curl "https://beta.todoist.com/API/v8/labels" \
    -X POST \
    --data '{"name": "Movies to watch"}' \
    -H "Content-Type: application/json" \
    -H "X-Request-Id: $(uuidgen)" \
    -H "Authorization: Bearer $token”

{
    "id": 1234,
    "name": "Project X",
    "order": 10
}
```

```python
import requests
requests.post(
    "https://beta.todoist.com/API/v8/labels",
    data=json.dumps({
        "name": "Movies to watch"
    }),
    headers={
        "Content-Type": "application/json",
        "X-Request-Id": str(uuid.uuid4()),
        "Authorization": "Bearer %s" % your_token
    }).json()


{
  "id": 1234,
  "name": "Project X",
  "order": 10
}
```

Creates a new label and returns its object as JSON.

### JSON body parameters

Parameter | Required | Description
--------- | -------- | -----------
name *String* | Yes | Name of the label
order *Integer* | No | Label order

## Get a label

> Get a label

```shell
$ curl "https://beta.todoist.com/API/v8/labels/1234" \
    -H "Authorization: Bearer $token”

{
    "id": 1234,
    "name": "Project X",
    "order": 10
}
```

```python
import requests
requests.get(
    "https://beta.todoist.com/API/v8/labels/1234",
    headers={
        "Authorization": "Bearer %s" % your_token
    }).json()


{
    "id": 1234,
    "name": "Project X",
    "order": 10
}
```

Returns a label by id

## Update a label

> Update a label

```shell
$ curl "https://beta.todoist.com/API/v8/labels/1234" \
    -X POST \
    --data '{"name": "Project Y"}' \
    -H "Content-Type: application/json" \
    -H "X-Request-Id: $(uuidgen)" \
    -H "Authorization: Bearer $token”
```

```python
import requests
requests.post(
    "https://beta.todoist.com/API/v8/labels/1234",
    data=json.dumps({
        "name": "Project Z"
    }),
    headers={
        "Content-Type": "application/json",
        "X-Request-Id": str(uuid.uuid4()),
        "Authorization": "Bearer %s" % your_token
    })

```

Updates a label and returns an empty body with a HTTP status code 204.

### JSON body parameters

Parameter | Required | Description
--------- | -------- | -----------
name *String* | No | New name of the label
order *Integer* | No | Number that is used by clients to sort list of labels

## Delete a label

> Delete a label

```shell
$ curl -X DELETE "https://beta.todoist.com/API/v8/labels/1234" \
    -H "Authorization: Bearer $token”
```

```python
import requests
requests.delete(
    "https://beta.todoist.com/API/v8/labels/1234",
    headers={
        "Authorization": "Bearer %s" % your_token
    })

```

Deletes a label and returns an empty body with a HTTP status code 204.
