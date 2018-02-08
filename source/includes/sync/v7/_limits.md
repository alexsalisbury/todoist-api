# Limits

There is currently a 1MiB http request body limit on POST requests. The exception to this rule is any of the *upload* endpoints which have a limit of 100 MiB.

Upload endpoints are for POST requests pointed at paths such as `/upload` and `/uploads/add`.

### Processing Timeouts

There are processing timeouts associated with each endpoint and these vary depending on the type of action being performed.

Type | Limit
---------- | -------
Uploads | 5 minutes
Standard Request | 15 seconds 

### Headers

Total size of HTTP headers cannot exceed 65 KiB. 

### Requests per Minute

You can make a total of 50 requests per minute with the Sync API. This can be further increased when commands are batched where possible as up to 100 batched commands can be sent per minute, giving us 5000 commands in this instance.