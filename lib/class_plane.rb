class Plane
  @@planes = []
  attr_accessor :location, :destination
  attr_reader :registration

  def self.list_all_planes
    @@planes
  end

  def initialize
    @registration = registration_new
    @destination = ''
    @location = "on_ground"

    @@planes << self
  end

  def land
    destination_full? ? @location = @destination : false
  end

  def take_off
    destination_set? ? @location = "in_air" : false
  end

  private
  def registration_new
    if @@planes.size < 1
      "G-AAAA"
    else
      @@planes[-1].registration.succ
    end
  end

  def destination_set?
    Airport.list_all_airports.include? @destination
  end

  def destination_full?
    Plane.list_all_planes.select {
      |planeobj| planeobj.location == @destination
    }.count < @destination.capacity
  end
end
