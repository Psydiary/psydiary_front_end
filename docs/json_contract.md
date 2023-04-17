Psydiary JSON Contract
### New User Create
---
 Request: `post 'api/v1/user'`

 Response:
```
{ 
	"data": {
		"id": "1",
		"type": "user",
		"attributes": {
			"name": "name",
			"email": "email",
			"password": "password"
			"ip_address": "ip_address"
			"protocol_id": 1,
			"data_sharing": boolean
		}
	}
}
```
---
  Request: `get 'users/:id/daily_log_entries/:id'`

  Response:
```
{
  "data": {
    "id": "1",
    "type": "daily_log_entry",
    "attributes": {
      "user_id": 2,
      "mood": "mood",
      "depression_score": 5,
      "anxiety_score": 2,
      "sleep_score": 3,
      "energy_levels": 2,
      "exercise": 4,
      "meditation": "meditation",
      "sociability": 3,
      "notes": "notes",
      "created_at": "April 16, 2023"
    }
  }
}
