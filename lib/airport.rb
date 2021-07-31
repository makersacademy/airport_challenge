class Airport
attr_reader :airport
    def initialize
    @airport = []
  end
  def land_airplane
    @airport.push('airplane')
    # Airplane.new
  end

end