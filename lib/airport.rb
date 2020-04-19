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
    fail 'STORMY WEATHER! TAKEOFF NOT ALLOWED!' if stormy?
    @current_plane_count -= 1
    confirm_takeoff
  end


  #---------#
  private

  def confirm_takeoff
    "Plane confirms that no longer at airport"
  end

    # def full?
    #   bikes.count >= DEFAULT_CAPACITY
    # end
    #

  def stormy?
    weather_condition = rand(0..1)
    "stormy" if weather_condition == 0
  end
  #---------#

end
