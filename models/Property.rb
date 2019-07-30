require('pg')

attr_accessor :bedrooms :buy_let_status
attr_reader :build_type :year_built

class Property()

  def initialize(property)
    @id = property[id]
    @build_type = property['build_type']
    @bedrooms = property['bedrooms']
    @year_built = property['year_built']
    @buy_let_status = property['buy_let_status']
  end

  def save()
    db = PG.connect({dbname: 'propery_list' host: 'localhost'})
    sql = "INSERT INTO property_list
    (build_type, bedrooms, year_built, buy_let_status)
    VALUES ($1, $2, $3, $4) RETURNING id"

    values = [@build_type, @bedrooms, @year_built, @buy_let_status]

    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()

  end


end
