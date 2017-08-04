# View Options

View Options is a object containing view configuration user have
set for different views.

Each key of View Options object identifies a view to which the view configuration
apply, and the associated value is a "View Option" object containing
actual the view configuration info.


> An example View Options

```json
{
    "today": {
        "view_type": "due"
    },
    "seven_day": {
        "view_type": null
    },
    "projects": {
        "18918319": {
            "view_type": "custom",
            "custom_view": {
                "group_by": "priority",
                "sort_by": "assignee",
                "include": "own"
            }
        },
        "18373182": {
            "view_type": "custom",
            "custom_view": {
                "group_by": null,
                "sort_by": "due",
                "include": "user_ids",
                "include_user_ids": [28137, 12129]
            }
        }
    }
}
```

### Properties

Property | Description
-------- | -----------
today *Object (View Option)* | View option for "Today" view
seven_days *Object (View Option)* | View option for "Next 7 days" view
projects *Object* | Object containing a key/value pair where the key identifies a project (by project id) and the value is a "View object" containing the view options for this project.



### View Option Object Properties

Property | Description
-------- | -----------
view_type *string or null* | Possible values: `"due"`, `"priority"`, `"assigned"`, `"custom"` or `null`. A null value indicates the view to be set to its default view configuration.
custom_view *Object* | An object containing the detail configuration of custom view. The field will be undefined when no custom view is configured.



### Custom View Object Properties

Property | Description
-------- | -----------
group_by *string or null* | Specifies how the tasks to be grouped into different section lists. Possible values: `"due"`, `"priority"`, `"assignee"`, `"project"` or `null`. A null value indicates the tasks should not be grouped.
sort_by *string or null* | Specifies how the tasks to be sorted within a group. Possible values: `"alphabetical"`, `"due"`, `"priority"`, `"assignee"` or `null`. A null value indicates the view to be set to its default sorting configuration.
include *string* | Specifying what tasks to be included in the view. Possible values: `"all"`, `"own"`, `"assigned"`, `"unassigned"`, `"user_ids"`
include_user_ids *List of Integer* | When the `include` properties equals `"user_ids"`, this property will be used to specified which users' tasks to be included in the filter view.


## Update View Options


The sync command `view_options_update` updates the user's View Options. The command arguments specified the views to
be updated.


> An example of updating Today and Next 7 Days's view options:

```shell
https://todoist.com/api/v7/sync \
    -d token=0123456789abcdef0123456789abcdef01234567 \
    -d commands='[{"type": "view_options_update", "uuid": "0b8690b8-59e6-4d5b-9c08-6b4f1e8e0eb8", "args": {"today": {"view_type": "due"}, "seven_days": {"view_type": "priority"}}}]'

```

### Parameters

Arguments | Required | Description
--------- | -------- | -----------
today *Object (View Option)* | No | Updated view option for 'Today' view
seven_days *Object (View Option)* | No |  Updated view option for 'Today' view
projects *Object* | No |  Updated view option for the specifiec projects


