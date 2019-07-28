class Airplane
  attr_reader :location

  def initialize
    @location = "sky"
  end

  def land_plane
    @location == "airport" ? fail('Error - plane already landed') : @location = "airport"
  end

  def take_off
    @location == "sky" ? fail('Error - plane already in sky') : @location = "sky"
    puts "Success, plane took off!"
  end
end
