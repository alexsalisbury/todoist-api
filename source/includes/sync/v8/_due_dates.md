# Due dates


Due dates for tasks and reminders is one of the core concepts of Todoist. It's 
very powerful and quite complex, because it has to embrace different use-cases
of Todoist users.

Todoist supports three types of due dates.

+ Full-day dates (like "1 January 2018" or "tomorrow")
+ Floating due dates with time (like "1 January 2018 at 12:00" or "tomorrow 
  at 10am")
+ Due dates with time and fixed timezone (like "1 January 2018 at 12:00 
  America/Chicago" or "tomorrow at 10am Asia/Jakarta")
  
Unless specified explicitly, dates with time are created as floating.
  
In addition, any of these due dates can be set to recurring or not, depending
on the date string, provided by the client.

+ [More about the difference between floating due dates and dates with fixed 
  timezones](https://get.todoist.help/hc/en-us/articles/360001450039)
+ [More about recurring due 
  dates](https://get.todoist.help/hc/en-us/articles/360000636289)
 

## Full-day dates

> An example of a full-day date
 
```json
{
    "date": "2016-12-01",
    "timezone": null,
    "string": "every day",
    "lang": "en",
    "is_recurring": true
}
``` 

### Properties

Property | Description
-------- | -----------
date *string* | Due date in the format of `YYYY-MM-DD` ([RFC 3339](https://tools.ietf.org/html/rfc3339)). For recurring dates, the date of the current iteration. 
timezone *string* | Always set to `null`.
string *string* | Human-readable representation of due date. String always represents the due object in user's timezone. Look at our reference to see [which formats are supported](https://get.todoist.help/hc/articles/205325931).
lang *string* | Lang which has to be used to parse the content of the string attribute. Used by clients and on the server side to properly process due dates when date object is not set, and when dealing with recurring tasks. Valid languages are: `en`, `da`, `pl`, `zh`, `ko`, `de`, `pt`, `ja`, `it`, `fr`, `sv`, `ru`, `es`, `nl`.
is_recurring *boolean* | Boolean flag which is set to "true" is due object represents a recurring due date 


## Floating due dates with time

> An example of a floating due date with time

```json
{
    "date": "2016-12-0T12:00:00",
    "timezone": null,
    "string": "every day at 12",
    "lang": "en",
    "is_recurring": true
}
```

Property | Description
-------- | -----------
date *string* | Due date in the format of `YYYY-MM-DDTHH:MM:SS`. For recurring dates, the date of the current iteration. Due date always represent an event in current user's timezone.  Note that it's not quite compatible with [RFC 3339](https://tools.ietf.org/html/rfc3339), because the concept of timezone is not applicable to this object. Also note that unlike fixed due dates, the date representation doesn't end with "Z"
timezone *string* | Always set to `null`.
string *string* | Human-readable representation of due date. String always represents the due object in user's timezone. Look at our reference to see [which formats are supported](https://get.todoist.help/hc/articles/205325931).
lang *string* | Lang which has to be used to parse the content of the string attribute. Used by clients and on the server side to properly process due dates when date object is not set, and when dealing with recurring tasks. Valid languages are: `en`, `da`, `pl`, `zh`, `ko`, `de`, `pt`, `ja`, `it`, `fr`, `sv`, `ru`, `es`, `nl`.
is_recurring *boolean* | Boolean flag which is set to "true" is due object represents a recurring due date 


## Due dates with time and fixed timezone

> An example of a due date with time and fixed timezone

```json
{
    "date": "2016-12-06T13:00:00Z",
    "timezone": "Europe/Madrid",
    "string": "ev day at 2pm",
    "lang": "en",
    "is_recurring": true
}
```

### Properties

Property | Description
-------- | -----------
date *string* | Due date in the format of `YYYY-MM-DDTHH:MM:SSZ` ([RFC 3339](https://tools.ietf.org/html/rfc3339)). For recurring dates, the date of the current iteration. Due date is stored in UTC. 
timezone *string* | Timezone of the due instance. Used to recalculate properly the next iteration for a recurring due date.
string *string* | Human-readable representation of due date. String always represents the due object in user's timezone. Look at our reference to see [which formats are supported](https://get.todoist.help/hc/articles/205325931).
lang *string* | Lang which has to be used to parse the content of the string attribute. Used by clients and on the server side to properly process due dates when date object is not set, and when dealing with recurring tasks. Valid languages are: `en`, `da`, `pl`, `zh`, `ko`, `de`, `pt`, `ja`, `it`, `fr`, `sv`, `ru`, `es`, `nl`.
is_recurring *boolean* | Boolean flag which is set to "true" is due object represents a recurring due date 


## Create or update due dates

Usually you create due dates when you create a new task or a reminder, or
you want to update a due date for an object. In both cases due date is provided
as a `due` attribute of an object. You may provide all fields of an object in
the constructor, but it's more convenient to provide only a subset of the
fields and let the server to fill the gaps.

### Create or update due date from user-provided string

You can ask user to provide a due string and to create a new object from that.
You need to provide a timezone if you want to create a fixed due date instead
of the floating one. If you want to create a task without a due date, you
can set due attribute to `null`.

See the code section to the right for more examples. In all cases you can set
the `lang` attribute of the date to set the language of the input. If language
is not set, the language from user settings will be used. 

> Input example

```json
"due": {"string":  "tomorrow"}
```
 
> Output example. Full-date instance is created.

```json
"due": {
    "date": "2018-11-15",
    "timezone": null,
    "is_recurring": false,
    "string": "tomorrow",
    "lang": "en"
}
```

> Input example

```json
"due": {"string":  "tomorrow at 12"}
```


> Output example. Floating due date created

```json
"due": {
    "date": "2018-11-15T12:00:00",
    "timezone": null,
    "is_recurring": false,
    "string": "tomorrow at 12",
    "lang": "en"
}
```

> Input example. Timezone is set explicitly

```json
"due": {"string": "tomorrow at 12", "timezone": "Asia/Jakarta"}
```

> Output example. Due date with fixed timezone created

```json
"due": {
    "date": "2018-11-16T05:00:00Z",
    "timezone": "Asia/Jakarta",
    "is_recurring": false,
    "string": "tomorrow at 12",
    "lang": "en"
}
```

### Create or update due date from a date object

In some cases you have a date object and want to create a due date from it.
Usually all you need to do is to chose the format of the due date (floating
or fixed) and format the time object properly with strftime or alternative for
your programming language. The formatted string goes to a "date" attribute of
the constructor.

Note that this approach does not allow you to create recurring due dates.


> Input example for a full-day event

```json
"due": {"date": "2018-10-14"}
```

For a full date event the format of the date attribute is `YYYY-MM-DD`.

> Output example

```json
"due": {
    "date": "2018-10-14",
    "timezone": null,
    "is_recurring": false,
    "string": "2018-10-14",
    "lang": "en"
}
```

> Input example for a floating due date

```json
"due": {"date": "2018-10-14T10:00:00"}
```

> Output example

```json
"due": {
    "date": "2018-10-14T10:00:00",
    "timezone": null,
    "is_recurring": false,
    "string": "2018-10-14 10:00",
    "lang": "en"
}
```

For a floating due date event the format of the date attribute is 
`YYYY-MM-DDTHH:MM:SS` and the date has to be provided in user's local
timezone.

> Input example for a due date with a fixed timezone

```json
"due": {"date": "2018-10-14T05:00:00Z"}
```

> Output example

```json
"due": {
    "date": "2018-10-14T05:00:00Z",
    "timezone": "Asia/Jakarta",
    "is_recurring": false,
    "string": "2018-10-14 12:00",
    "lang": "en"
}
```

For a floating due date event the format of the date attribute is 
`YYYY-MM-DDTHH:MM:SSZ` (mind the "Z" ending) and the date has to be provided
in UTC. Optionally you can provide a timezone name to overwrite the default
timezone of the user.
