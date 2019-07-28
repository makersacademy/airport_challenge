class Airport
  attr_reader :airport_name, :airplanes

  def initialize(airport_name)
    @airport_name = airport_name
    @airplanes = []
  end

end
