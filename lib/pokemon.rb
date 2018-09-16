class Pokemon

    attr_reader :id, :name, :type, :db

    def initialize(id:, name:,type:,db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name, type) Values (?,?)",name,type)
    end

    def self.find(id,db)
        pkm = db.execute("Select id,name,type from pokemon where id=?",id)
        pkm = pkm.flatten
        pika = Pokemon.new(id: pkm[0],name: pkm[1],type:pkm[2],db:db)
        pika
    end

end
