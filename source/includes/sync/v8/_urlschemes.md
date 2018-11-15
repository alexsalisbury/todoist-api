# URL schemes

The following URL schemes might also be useful when accessing the Todoist
applications (iOS and Android) or when performing certain actions with them, so
they are also included here for completeness.

## Views

The following schemes are available to open a specific view:

Scheme | Description
------ | -----------
todoist:// | Opens Todoist.
todoist://today | Opens the today view.
todoist://next7days | Opens the next 7 days view.
todoist://profile | Opens the profile view.
todoist://inbox | Opens the inbox view.
todoist://teaminbox | Opens the team inbox view. If the user doesn't have a business account (access to team inbox), it will show an alert saying that he/she doesn't have access to the team inbox because he/she doesn't have a business account and will be redirected automatically to the inbox view.
todoist://notifications | Opens notifications view.

## Tasks

> Example of adding a task:

```text
todoist://addtask?content=mytask&date=tomorrow&priority=4
```

The following scheme is available to create new tasks:

Scheme | Description
------ | -----------
todoist://addtask | Opens the add task view to add a new task to Todoist.

> Here's an example of a content value:

```text
Create document about URL Schemes!
```

> And how it should be supplied using Percent-encoding:

```text
Create&20document%20about%20URL%20Schemes%21
```

> Here's an example of a date value:

```text
Tomorrow @ 14:00
```

> And how it should be supplied using Percent-encoding:

```text
Tomorrow%20@%2014:00
```

The `todoist://addtask` scheme accepts the following optional values:

Value | Description
----  | -----------
content *URL encoding*| The content of the task, which should be a string that in `Percent-encoding` (also known as URL encoding).
date *URL encoding*| The due date of the task, which should be a string that in `Percent-encoding` (also known as URL encoding). Look at our reference to see [which formats are supported](https://todoist.com/Help/DatesTimes).
priority *Integer*| The priority of the task (a number between `1` and `4`, `4` for very urgent and `1` for natural). <br>**Note**: Keep in mind that `very urgent` is the priority 1 on clients. So, `p1` will return `4` in the API.

If all the values are empty, it will just open the add task view. This URL
Scheme will not automatically add the task to Todoist, it will just open the add
task view and fill the fields.

## Projects

The following scheme is available to show all the projects:

Scheme | Description
------ | -----------
todoist://projects | Opens the projects view (shows all projects).

> Example of opening a specific project:

```text
todoist://project?id=128501470
```

The following scheme is available to open a specific project:

Scheme | Description
------ | -----------
todoist://project | Opens a specific project using the id of the project.

The `todoist://project` scheme accepts the following required value:

Value | Description
----  | -----------
id *Integer*| The id of the project to view. If the id doesn't exist, you don’t have access to the project, or the value is empty, an alert will be showed and the user will be redirected to the projects view.

## Labels

The following scheme is available to show all the labels:

Scheme | Description
------ | -----------
todoist://labels | Opens the labels view (shows all labels)

> Example of opening a specific label:

```text
todoist://label?id=1234
```

The following scheme is available to open a specific label:

Scheme | Description
------ | -----------
todoist://label | Opens a specific label using the id of the label.

The `todoist://label` scheme accepts the following required value:

Value | Description
----  | -----------
id *Integer*| The id of the label to view. If the id doesn't exist, you don’t have access to the label, or the value is empty, an alert will be showed and the user will be redirected to the labels view.

## Filters

The following scheme is available to show all the filters:

Scheme | Description
------ | -----------
todoist://filters | Opens the filters view (shows all filters)

> Example of opening a specific filter:

```text
todoist://filter?id=9
```

The following scheme is available to open a specific filter:

Scheme | Description
------ | -----------
todoist://filter | Opens a specific filter using the id of the filter.

The `todoist://filter` scheme accepts the following required value:

Value | Description
----  | -----------
id *Integer*| The id of the filter to view. If the id doesn't exist, you don’t have access to the filter, or the value is empty, an alert will be showed and the user will be redirected to the filters view.


## Search

> Example of searching for "Test & Today":

```text
todoist://search?query=Test%20%26%20Today
```

The following scheme is available for searching (Android only):

Scheme | Description
------ | -----------
todoist://search | Used to search in the Todoist application.

The `todoist://search` scheme accepts the following required value:

Value | Description
----  | -----------
query *URL encoding*| The query to search in the Todoist application, which should be a string that is in `Percent-encoding` (also known as URL encoding).
