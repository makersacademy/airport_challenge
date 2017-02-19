require_relative 'plane'
require_relative 'default_capacity_module'

class Airport

  attr_reader :taken_off, :landed, :current_plane, :plane

  def initialize
    @landed = []
    @taken_off = []
    #@latest_plane
    @landing_plane
    #@flying
    @current_plane = []
    @weather = 1
    #@plane = []
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
    weather_generator
    if stormy?
      fail 'Stormy weather preventing landing'
    else
      @landing_plane = Plane.new # false
      @landed << @landing_plane
    end
  end
# consider removing this one and the test
  def plane_left_airport?
      if (@current_plane == @taken_off.pop) && !(@current_plane == nil)
        true
      else
        false
      end
  end

  def landed_planes
    @landed.count
  end

  def available_plane?
    if (landed_planes > 0)
      true
    else
      false
    end
  end

  def take_off
    fail 'No available planes' if !available_plane?
    weather_generator
      if stormy?
        fail 'Stormy weather preventing take-off'
      else
        @current_plane = landed.pop
        @taken_off.push(@current_plane)
        plane_left_airport?
      end
    end
  end
