require_relative 'plane'
require_relative 'default_capacity_module'

class Airport

  attr_reader :taken_off

  def initialize
    @landed = []
    @taken_off = []
    @latest_plane
    @landing_plane
    @flying
    @weather = 1
    #@new_plane_landed = Plane.new #false
  end

  def confirm_landed?
    if (@landing_plane == @landed.pop)
      true
    else
      false
    end
  end

  def airport_full?
    if (@landed.count == DefaultCapacity::MEDIUM)
      true
    else
      false
    end
  end

  def stormy?(weather=@weather)
    if (weather == 3)
      true
    else
      false
    end
  end

  def weather_generator
    @weather = [1,1,2,2,2,2,3,4,5].sample
  end

  def land_plane
    fail 'Airport full' if airport_full?
    @landing_plane = Plane.new # false
    @landed << @landing_plane
  end

  def plane_left_airport?
    if (@current_plane == taken_off.pop)
      true
    else
      false
    end

  end

  def take_off(plane=@landed.pop)
    if stormy?
      fail 'Stormy weather preventing take-off'
    else
      @current_plane = plane
      @taken_off.push(@current_plane)
    end
  end
end
