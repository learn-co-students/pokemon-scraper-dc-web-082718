class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    hash = Hash.new
    hash[:id] = pokemon_data[0]
    hash[:name] = pokemon_data[1]
    hash[:type] = pokemon_data[2]
    hash[:db] = pokemon_data[3]
    Pokemon.new(hash)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
