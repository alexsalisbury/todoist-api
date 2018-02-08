# Batching commands

> Batching multiple commands

When working with the Sync API, changes can be **batched** into one commit. In our example, we're batching the creation of a Shopping List project with three different items.

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

