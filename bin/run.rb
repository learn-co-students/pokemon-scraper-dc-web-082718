require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
pokemon_array = @db.execute("SELECT *
  FROM pokemon
  WHERE pokemon.id = ?", 1).flatten

this_pokemon = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: @db)

binding.pry
0
