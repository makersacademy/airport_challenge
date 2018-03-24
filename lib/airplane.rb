class Airplane
  attr_reader :in_flight, :location
  def initialize 
    @in_flight = false
    @location = 'unassigned'
  end
end 
