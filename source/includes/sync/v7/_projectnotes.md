# Project Notes

> An example project note object

```json
{
  "content": "Hello 2",
  "file_attachment": {
    "file_type": "text/plain",
    "file_name": "File1.txt",
    "file_size": 1234,
    "file_url": "https://example.com/File1.txt",
    "upload_state": "completed"
  },
  "id": 2310972895,
  "is_archived": 0,
  "is_deleted": 0,
  "posted": "Tue 14 Aug 2018 10:56:50 +0000",
  "posted_uid": 16017653,
  "project_id": 2191777224,
  "reactions": null,
  "uids_to_notify": [13432367],
  "reactions": {"❤️": [14781321], "👍": [14781321, 12213313]}
}
```

*Project Notes are only available for Todoist Premium users.*

### Properties

Property | Description
-------- | -----------
id *Integer* | The id of the note.
posted_uid *Integer* | The id of the user that posted the note.
project_id *Integer* | The project which the note is part of.
content *String* | The content of the note.
file_attachment *Object* | A file attached to the note (see more details about attachments later on).
uids_to_notify *Array of Integer* | A list of user ids to notify.
is_deleted *Integer* | Whether the note is marked as deleted (where `1` is true and `0` is false).
is_archived *Integer* | Whether the note is marked as archived (where `1` is true and `0` is false).
posted *String* | The date when the note was posted.
reactions *Object* | List of emoji reactions and corresponding user ids.

### File attachments

A file attachment is represented as a JSON object. The file attachment may point
to a document previously uploaded by the `uploads/add` API call, or by any
external resource.

### Base file properties

Attribute | Description
--------- | -----------
file_name *String* | The name of the file.
file_size *Integer* | The size of the file in bytes.
file_type *String* | MIME type (for example `text/plain` or `image/png`).
file_url *String* | The URL where the file is located. Note that we don't cache the remote content on our servers and stream or expose files directly from third party resources. In particular this means that you should avoid providing links to non-encrypted (plain HTTP) resources, as exposing this files in Todoist may issue a browser warning.
upload_state *String* | Upload completion state (for example `pending` or `completed`).

### Image file properties

If you upload an image, you may provide thumbnail paths to ensure Todoist
handles them appropriately. Valid thumbnail information is a JSON array with
URL, width in pixels, height in pixels. Ex.:
["http://example.com/img.jpg",400,300]. "Canonical" thumbnails (ones we create
by `uploads/add` API call) have the following sizes: `96x96`, `288x288`,
`528x528`.

Attribute | Description
--------- | -----------
tn_l *List* | Large thumbnail (a list that contains the URL, the width and the height of the thumbnail).
tn_m *List* | Medium thumbnail (a list that contains the URL, the width and the height of the thumbnail).
tn_s *List* | Small thumbnail (a list that contains the URL, the width and the height of the thumbnail).

### Audio file properties

If you upload an audio file, you may provide an extra attribute `file_duration`
(duration of the audio file in seconds, which takes an integer value). In the
web interface the file is rendered with a `<audio>` tag, so you should make sure
it's supported in current web browsers. See
[supported media formats](https://developer.mozilla.org/en-US/docs/HTML/Supported_media_formats) for
the reference.


## Add a note

> An example of adding a project note:

```shell
curl https://todoist.com/api/v7/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "note_add", "temp_id": "59fe4461-287b-4b00-bacc-ee771137a732", "uuid": "e1005f08-acd6-4172-bab1-4338f8616e49", "args": {"project_id": 2191777224, "content": "Note1"}}]'


# or adding a note with a file attached:

$ curl https://todoist.com/api/v7/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "note_add", "temp_id": "6149e689-1a54-48d6-a8c2-0ee5425554a9", "uuid": "554a65e9-56d9-478e-b35b-520c419e37d9", "args": {"project_id": 2191777224, "content": "Note1", "file_attachment": {"file_type":"image\/gif","file_name":"image.gif","image":"https:\/\/domain\/image.gif","file_url":"https:\/\/domain\/image.gif","image_width":90,"image_height":76,"file_size":7962}}}]'

{
  ...
  "sync_status": {"e1005f08-acd6-4172-bab1-4338f8616e49": "ok"},
  "temp_id_mapping": {"59fe4461-287b-4b00-bacc-ee771137a732": 17299568},
  ...
}
```

```python
>>> import todoist
>>> api = todoist.TodoistAPI('0123456789abcdef0123456789abcdef01234567')
>>> note = api.project_notes.add(128501682, 'Note1')
>>> api.commit()
```

Argument | Required | Description
--------- | -------- | -----------
project_id *Integer or String (temp_id)* | Yes | The project which the note is part of.
content *String* | Yes | The content of the note.
file_attachment *Object* | No | A file attached to the note (see more details about attachments above, and learn how to upload a file in the [Uploads section](#uploads)).


## Update a note

> An example of updating a note:

```shell
$ curl https://todoist.com/api/v7/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "note_update", "uuid": "8a38f9c5-2cd0-4da5-87c1-26d617b354e0", "args": {"id": 17299568, "content": "UpdatedNote1"}}]'

{
  ...
  "sync_status": {"8a38f9c5-2cd0-4da5-87c1-26d617b354e0": "ok"},
  ...
}
```

```python
>>> import todoist
>>> api = todoist.TodoistAPI('0123456789abcdef0123456789abcdef01234567')
>>> note = api.project_notes.get_by_id(17299568)
>>> note.update(content='UpdatedNote1')
>>> api.commit()
```

### Command arguments

Argument | Required | Description
--------- | -------- | -----------
id *Integer or String (temp_id)* | Yes | The id of the note.
content *String* | Yes | The content of the note.
file_attachment *Object* | No | A file attached to the note (see more details about attachments above, and learn how to upload a file in the [Uploads section](#uploads)).

## Delete a note

> An example of deleting a note:

```shell
$ curl https://todoist.com/api/v7/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "note_delete", "uuid": "8a38f9c5-2cd0-4da5-87c1-26d617b354e0", "args": {"id": 2311081457}}]'
{ ...
  "sync_status": {"8d666fda-73c3-4677-8b04-5d223632c24f": "ok"},
  ... }
```

```python
>>> import todoist
>>> api = todoist.TodoistAPI('0123456789abcdef0123456789abcdef01234567')
>>> note = api.project_notes.get_by_id(17299568)
>>> note.delete()
>>> api.commit()
```

### Command arguments

Argument | Required | Description
--------- | -------- | -----------
id *Integer or String (temp_id)* | Yes | The id of the note.
