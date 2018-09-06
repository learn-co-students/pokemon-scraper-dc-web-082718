require 'pry'

class Pokemon
  attr_reader :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  database_connection = SQLite3::Database.new('db/pokemon.db')

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    array = database_connection.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    name = array[0][1]
    type = array[0][2]
    # hp = array[0][]

    pokemon_new = Pokemon.new(id:id, type:type, name: name, db: database_connection)
    pokemon_new
  end

  # def alter_hp(hp, database_connection)
  #   database_connection.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", hp, self.name)
  # end

end
