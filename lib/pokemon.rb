class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(name:, type:, id:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)

    pokemon_array = db.execute("SELECT *
      FROM pokemon
      WHERE pokemon.id = ?", id).flatten

      Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db)

    # pokemon = Pokemon.new(pokemon_array[1])
    # pokemon.type = pokemon_array[2]
    # pokemon.id = pokemon_array[0] #why doesnt this work?

  end

end
