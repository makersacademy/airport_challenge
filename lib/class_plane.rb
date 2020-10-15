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
    @location = "on_ground"
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
    @destination != ''
  end
end
