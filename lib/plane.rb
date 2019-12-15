class Plane
attr_reader :name
attr_reader :status
attr_reader :location

  def initialize(name = "plane", status = "flying", location = "in the air")
    @name = name
    @status = status
    @location = location
  end
  def take_off(airport)
    return "Plane not at that airport" if @location != airport.name
      @status = "flying"
      @location = "in the air"
      airport.take_off(self)
  end
  def land(airport)
    return "Plane is already on the ground" if @status == "landed"
    return "Plane unable to land as airport is full" if airport.full? == true
    @status = "landed"
    @location = airport.name
    airport.land(self)
  end
end
