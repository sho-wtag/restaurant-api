# Restaurant Reservation API

https://api-restaurants.herokuapp.com/

## API

## Create reservation

* Post JSON to `/reservations`

### Request

* Type: `POST`
* Header: `Content-Type: application/json`
* Body:

```json
{
  "guest":{
  	"name": "altruist",
    "email": "altruist2692@gmail.com"
  },
  "reservation":{
  	"dining_table_id": 4,
    "restaurant_id": 3,
    "guest_count": 2,
    "reservation_time": "9 AM",
    "shift_id": 1
  }
}
```

#### Response Body:

```json
{
    "data": {
        "reservation": {
            "reservation_time": "09:00AM",
            "guest_count": 2,
            "guest_name": "altruist",
            "dining_table_name": "Table-4"
        }
    }
}
```