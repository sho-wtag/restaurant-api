Shift.find_or_create_by(start_time: Time.zone.parse('9AM'), end_time: Time.zone.parse('1PM'))
Shift.find_or_create_by(start_time: Time.zone.parse('6PM'), end_time: Time.zone.parse('11PM'))

restaurants = [{ name: 'Italian Cafe',
                 email: 'nishantupadhyay26@gmail.com',
                 phone: '1824448289',
                 shift_id: Shift.first.id },
               { name: 'Italian Eatery',
                 email: 'dev.daxesh26@gmail.com',
                 phone: '2524220508',
                 shift_id: Shift.first.id },
               { name: 'Italian Kitchen',
                 email: 'erik@wehner.com',
                 phone: '4571023713',
                 shift_id: Shift.first.id },
               { name: 'Italian Pub',
                 email: 'forrest_beahan@huels.org',
                 phone: '5713585003',
                 shift_id: Shift.first.id },
               { name: 'Italian Diner',
                 email: 'denis.ankunding@legroscruickshank.com',
                 phone: '9996913912',
                 shift_id: Shift.first.id },
               { name: 'Italian Stand',
                 email: 'mazie@eichmann.io',
                 phone: '7396667824',
                 shift_id: Shift.last.id },
               { name: 'Italian Palace',
                 email: 'eryn@hermistoneichmann.org',
                 phone: '0625634612',
                 shift_id: Shift.last.id },
               { name: 'Italian Tavern',
                 email: 'christina@berge.co',
                 phone: '8267926407',
                 shift_id: Shift.last.id },
               { name: 'Italian Bar',
                 email: 'celestine@franeckischroeder.name',
                 phone: '1961781438',
                 shift_id: Shift.last.id },
               { name: 'Italian Dining room',
                 email: 'osvaldo_schoen@cruickshank.info',
                 phone: '6419184839',
                 shift_id: Shift.last.id }]

# iterating and preparing list of restaurants
restaurants.each do |restaurant|
  Restaurant.find_or_create_by(restaurant)
end

# preparing tables for restaurant
all_restaurants = Restaurant.all
all_restaurants.each do |restaurant|
  i = 0
  6.times do
    i += 1
    table = restaurant.dining_tables.build(name: "Table-#{i}", min_capacity: 1, max_capacity: i*2)
    table.save
  end
end
