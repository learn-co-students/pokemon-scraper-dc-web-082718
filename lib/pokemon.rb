require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: '', name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)

    new_mon = Pokemon.new(name: name, type: type, db: db)

    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)", name, type)

    mon_with_id = db.execute("SELECT * FROM pokemon
      WHERE pokemon.name = ?", name)

    new_mon.id = mon_with_id[0][0]

    new_mon

  end

  def self.find(id, db)
    new_mon = db.execute("SELECT * FROM pokemon
      WHERE pokemon.id = ?", id)
    Pokemon.new(id: new_mon[0][0], name: new_mon[0][1], type: new_mon[0][2], db: db)
  end

end
