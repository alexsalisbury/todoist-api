# Batching commands

> Batching multiple commands

When working with the Sync API, changes can be **batched** into one commit. In our example, we're batching the creation of a Shopping List project with three different items.

```shell
curl https://todoist.com/api/v8/sync \
  -d token=0123456789abcdef0123456789abcdef01234567 \
  -d commands='[
  {
    "type": "project_add",
    "temp_id": "0a57a3db-2ff1-4d2d-adf6-12490c13c712",
    "uuid": "2c0f6e03-c372-46ba-8e85-d94af56abcf3",
    "args": { "name": "Shopping List" }
  },
  {
    "type": "item_add",
    "temp_id": "ef3d840e-84c9-4433-9a32-86ae9a1e7d42",
    "uuid": "49ede211-12f3-42e9-8345-4c0d2b29c08d",
    "args": { "content": "Bananas", "project_id": "0a57a3db-2ff1-4d2d-adf6-12490c13c712" }
  },
  {
    "type": "item_add",
    "temp_id": "8a23c8cb-1d76-469d-a2c0-80a28b3ea6f6",
    "uuid": "46619250-ae02-4ab0-bd31-3c9ab0307e53",
    "args": { "content": "Apples", "project_id": "0a57a3db-2ff1-4d2d-adf6-12490c13c712" }
  },
  {
    "type": "item_add",
    "temp_id": "bf087eaf-aea9-4cb1-ab57-85188a2d428f",
    "uuid": "d0a1666b-d615-4250-aac5-65c7ea89091a",
    "args": { "content": "Oranges", "project_id": "0a57a3db-2ff1-4d2d-adf6-12490c13c712" }
  }]'


{ 
  "sync_status": { 
    "2c0f6e03-c372-46ba-8e85-d94af56abcf3": "ok",
    "49ede211-12f3-42e9-8345-4c0d2b29c08d": "ok", 
    "d0a1666b-d615-4250-aac5-65c7ea89091a": "ok", 
    "46619250-ae02-4ab0-bd31-3c9ab0307e53": "ok" 
  },
  "temp_id_mapping": {
    "8a23c8cb-1d76-469d-a2c0-80a28b3ea6f6": 2532257185, 
    "0a57a3db-2ff1-4d2d-adf6-12490c13c712": 2178698342, 
    "bf087eaf-aea9-4cb1-ab57-85188a2d428f": 2532257187, 
    "ef3d840e-84c9-4433-9a32-86ae9a1e7d42": 2532257182 
  }, 
  "full_sync": true, 
  "sync_token": "ejXTquzEdPmZb3E82aFs_wp3oassQzhj3xtpVH8-EaRRJfpZPVXhtVRyTvQz-Mjf827kM8rNuT8pXeumPrEE8qjvYTOe-nIWVgog23OOECR4Gj0" 
}
```

```python
from todoist.api import TodoistAPI
api = TodoistAPI('0123456789abcdef0123456789abcdef01234567')

shopping_list = api.projects.add('Shopping List')
item_one = api.items.add('Bananas', shopping_list['id'])
item_two = api.items.add('Apples', shopping_list['id'])
item_three = api.items.add('Oranges', shopping_list['id'])

api.commit()

print(shopping_list, item_one, item_two, item_three)
```

As we’ve committed the changes all at once, we’re significantly reducing the amount of network calls that have to be made, as well as ensuring we’re not running into any rate limiting issues.

We’re able to batch up to 100 commands per request and when combined with the 50 requests per minute, this gives us a total of 5,000 requests per minute when maximally batched.

