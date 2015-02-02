# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.delete_all
Artist.delete_all
Record.delete_all

rock = Genre.create(id: 1, name: 'Rock')
metal = Genre.create(id: 2, name: 'Metal')
blues = Genre.create(id: 3, name: 'Blues')
jazz = Genre.create(id: 4, name: 'Jazz')
country = Genre.create(id: 5, name: 'Country')
pop_rock = Genre.create(id: 6, name: 'Pop Rock')

pink_floyd = Artist.create(id: 1, name: 'Pink Floyd')
genesis = Artist.create(id: 2, name: 'Genesis')
led_zeppelin = Artist.create(id: 3, name: 'Led Zeppelin')
louis_armstrong = Artist.create(id: 4, name: 'Louis Armstrong')
system_of_a_down = Artist.create(id: 5, name: 'System Of A Down')
miles_davis = Artist.create(id: 6, name: 'Miles Davis')
johny_cash = Artist.create(id: 7, name: 'Johny Cash')
black_sabbath = Artist.create(id: 8, name: 'Black Sabbath')
willie_nelson = Artist.create(id: 9, name: 'Willie Nelson')
muddy_waters = Artist.create(id: 10, name: 'Muddy Waters')

Record.create(id: 1, genre: rock, artist: pink_floyd, name: "The Dark Side Of The Moon", 
  price: 50.00, release_year: 1973)
Record.create(id: 2, genre: rock, artist: genesis, name: "The Lamb Lies Down On Broadway", 
  price: 72.50, release_year: 1974)
Record.create(id: 3, genre: pop_rock, artist: genesis, name: "Invisible Touch", 
  price: 36.00, release_year: 1986)
Record.create(id: 4, genre: metal, artist: black_sabbath, name: "Paranoid", 
  price: 35.00, release_year: 1970)
Record.create(id: 5, genre: metal, artist: system_of_a_down, name: "Toxicity", 
  price: 30.00, release_year: 2001)
Record.create(id: 6, genre: metal, artist: system_of_a_down, name: "Mezmerize", 
  price: 30.00, release_year: 2005)
Record.create(id: 7, genre: metal, artist: black_sabbath, name: "Black Sabbath", 
  price: 25.00, release_year: 1969)
Record.create(id: 8, genre: rock, artist: pink_floyd, name: "Wish You Were Here", 
  price: 40.00, release_year: 1975)
Record.create(id: 9, genre: rock, artist: pink_floyd, name: "Animals", 
  price: 30.00, release_year: 1977)
Record.create(id: 10, genre: rock, artist: pink_floyd, name: "The Wall", 
  price: 50.00, release_year: 1979)
Record.create(id: 11, genre: rock, artist: led_zeppelin, name: "Led Zeppelin II", 
  price: 33.00, release_year: 1969)
Record.create(id: 12, genre: jazz, artist: louis_armstrong, name: "Satchmo In Style", 
  price: 40.00, release_year: 1959)
Record.create(id: 13, genre: jazz, artist: miles_davis, name: "Bags' Groove", 
  price: 30.00, release_year: 1957)
Record.create(id: 14, genre: country, artist: willie_nelson, name: "Always On My Mind", 
  price: 16.00, release_year: 1982)
Record.create(id: 15, genre: country, artist: willie_nelson, name: "Stardust", 
  price: 45.00, release_year: 1978)
Record.create(id: 16, genre: blues, artist: muddy_waters, name: "Fathers And Sons", 
  price: 42.00, release_year: 1969)
Record.create(id: 17, genre: rock, artist: genesis, name: "Genesis", 
  price: 37.50, release_year: 1983)
