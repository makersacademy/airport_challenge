require_relative 'plane'

class Airport

  attr_reader :airport_capacity, :current_plane_count

  DEFAULT_CAPACITY = 100
  CURRENT_PLANE_COUNT = 0

  def initialize (airport_capacity = DEFAULT_CAPACITY)
    @airport_capacity = airport_capacity
    @current_plane_count = CURRENT_PLANE_COUNT
  end

  def land
    fail 'WARNING! AIRPORT FULL!' if current_plane_count >= DEFAULT_CAPACITY
    @current_plane_count += 1
  end

  def take_off
  end

  def confirm_location
    puts "Plane can confirm that no longer at airport"
  end


end
