class Plane

  attr_reader :airport, :destination

  def initialize (airport_name = "")
    @flying = false
    @airport = airport
  end

  def land (airport_name = "")
    @airport = airport_name
    @flying = false
  end

  def take_off (destination = "")
    @airport = ""
    @destination = destination
    @flying = true
  end

  def status
    @flying ? "Flying" : "In Airport"
  end

end
