require_relative 'plane'
require_relative 'default_capacity_module'

class Airport

  attr_reader :taken_off, :landed, :current_plane, :plane

  def initialize
    @landed = []
    @taken_off = []
    #@landing_plane
    @current_plane = []
    @weather = 1
  end

  def confirm_landed?
    if (@current_plane == @landed[-1])
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
# will randomly decide whether it is stormy or not
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
# will land plane if weather is not stormy and there is space available at airport
  def land_plane
    fail 'Airport full' if airport_full?
    weather_generator
    if stormy?
      fail 'Stormy weather preventing landing'
    else
      #@landing_plane = Plane.new
      @current_plane = Plane.new
      @landed << @current_plane
      display_airport_information
    end
  end
# checks to confirm that the same plane that was instructed to take off is the one that left the airport
  def plane_left_airport?
      if (@current_plane == @taken_off[-1]) && !(@current_plane == nil)
        true
      else
        false
      end
  end

  def landed_planes
    @landed.count
  end

  def display_airport_information
    singular = "plane that has"
    singular_is = "is currently"
    plural = "planes that have"
    plural_are = "are currently"

    if (@landed.count == 1)
      puts "There #{singular_is} #{@landed.count} #{singular} landed."
    elsif (@landed.count == 0)
      puts "There #{plural_are} no #{plural} landed."
    else
      puts  "There #{plural_are} #{@landed.count} #{plural} landed."
    end
  end

  def available_plane?
    if (landed_planes > 0)
      true
    else
      false
    end
  end
# will allow plane to take off if the weather is not stormy and there is an available plane
  def take_off
    fail 'No available planes' if !available_plane?
    weather_generator
      if stormy?
        fail 'Stormy weather preventing take-off'
      else
        @current_plane = landed.pop
        @taken_off.push(@current_plane)
        display_airport_information
      end
    end
  end
