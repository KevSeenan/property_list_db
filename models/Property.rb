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


end
