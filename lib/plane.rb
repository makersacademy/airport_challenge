class Plane
  attr_reader :flight_no, :condition

  def initialize(flight_no=nil, condition=:working)
    @flight_no = flight_no
    @condition = condition
  end
end