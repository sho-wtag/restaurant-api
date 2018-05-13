# Restaurant Reservation API

API:  https://api-restaurants.herokuapp.com/

API Doc:  https://doc-api-restaurant.herokuapp.com/index.html

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

## Update reservation

* PUT JSON to `/reservations/reservation_id`

### Request

* Type: `PUT`
* Header: `Content-Type: application/json`
* Body:

```json
{
  "reservation":{
  	"dining_table_id": 3,
    "restaurant_id": 1,
    "guest_count": 3,
    "reservation_time": "11 PM",
    "shift_id": 2
  }
}
```

#### Response Body:

```json
{
    "data": {
        "reservation": {
            "reservation_time": "11:00PM",
            "guest_count": 3,
            "guest_name": "john",
            "dining_table_name": "Table-3"
        }
    }
}
```

## Get list of reservations in a restaurant. 

* GET `/reservations/restaurant_id`

#### Response Body: 

```json
{
    "data": [
        {
            "reservation_time": "10:00AM",
            "guest_count": 5,
            "guest_name": "altruist",
            "dining_table_name": "Table-5"
        },
        {
            "reservation_time": "10:00AM",
            "guest_count": 5,
            "guest_name": "altruist",
            "dining_table_name": "Table-5"
        },
        {
            "reservation_time": "09:00PM",
            "guest_count": 3,
            "guest_name": "john",
            "dining_table_name": "Table-3"
        },
        {
            "reservation_time": "09:00AM",
            "guest_count": 2,
            "guest_name": "altruist",
            "dining_table_name": "Table-6"
        }
    ]
}
```