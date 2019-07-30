require('pg')

class Property

  attr_accessor :bedrooms, :buy_let_status
  attr_reader :build_type, :year_built, :id

  def initialize(property)
    @id = property[id].to_i() if property['id']
    @build_type = property['build_type']
    @bedrooms = property['bedrooms']
    @year_built = property['year_built']
    @buy_let_status = property['buy_let_status']
  end

  def save()
    db = PG.connect({dbname: 'property_list', host: 'localhost'})
    sql = "INSERT INTO property_list
    (build_type, bedrooms, year_built, buy_let_status)
    VALUES ($1, $2, $3, $4) RETURNING id"

    values = [@build_type, @bedrooms, @year_built, @buy_let_status]

    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()

  end

  def update()
    db = PG.connect({dbname: "property_list", host: 'localhost'})

    sql = "UPDATE property_list SET
    (build_type, bedrooms, year_built, buy_let_status) = ($1, $2, $3, $4)
    WHERE id = $5"

    values = [@build_type, @bedrooms, @year_built, @buy_let_status, @id]

    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()

  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_list', host: 'localhost'})
    sql = "DELETE FROM property_list"

    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'property_list', host: localhost})
    sql = "DELETE FROM property_list WHERE id = $1"

    values = [@id]

    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()

  end

  def self.all()
    db = PG.connect({dbname: 'property_list', host: 'localhost'})
    sql = "SELECT * FROM property_list"

    db.prepare("all", sql)
    property = db.exec_prepared("all")
    db.close()
    return property.map{ |property| Property.new(property) }

  end


end
