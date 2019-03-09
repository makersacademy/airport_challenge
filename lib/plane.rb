class Plane
  attr_accessor :location

  def initialize(location = "Flying")
    @location = location
    @destinations = [location]
  end

  def land(airport)
    if @destinations.include?(airport.name)
      @location = airport.name
    end
  end

  def update_satnav(airport)
    if @destinations.include?(airport.name)
      puts "Satnav is up to date"
    else
      @destinations << airport.name
    end
  end
end
