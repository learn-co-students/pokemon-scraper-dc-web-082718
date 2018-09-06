class Pokemon

  attr_accessor :name, :type, :db, :hp, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @hp = hp
    @id = id
  end

  def self.save(name, type, db) #why not keyword args?
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id_num, db)
    poke_data = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: poke_data[0], name: poke_data[1], type: poke_data[2], db: db)
  end




end
