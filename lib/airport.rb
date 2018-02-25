require_relative './modules.rb'

class Airport
# Airport is 'full' or 'not full'
attr_accessor :ramps, :airport_status, :airport_capacity, :stormy

  # Create new Airport
  # Optional argument airport_full is default to be pre-populated with planes
  # Optional argument airport_capacity default to be constant AIR_CAP
  def initialize(airport_full = "full", airport_capacity = CAPACITY::AIR_CAP)
    # @ramps is where planes are located when landed
    # Create blank empty array
    @ramps = []
    @airport_capacity = airport_capacity

    # Pre-populate @ramps with planes if set to be "full"
    if airport_full == "full"
      airport_capacity.times { |i|
        @plane = Plane.new("JN#{i}")
        @plane.landed
        @ramps << @plane
        i+=1
      }
    # Else set to a single nil element
    else
      @ramps = Array.new(@airport_capacity, nil)
    end
    airport_full?
    weather
  end

  # Land plane at airport at @ramp index location idx
  def land_plane(plane, idx)
    # Generate weather status (sunny / stormy)
    #weather
    # Raise an error if airport is full or weather is stormy
    raise "No ramp at location #{idx}" if idx > @airport_capacity - 1
    raise "Airport is full - cannot land" if airport_full? == "full"
    raise "Ramp #{idx} is not empty" if @ramps[idx] != nil
    raise "Plane is already landed" if plane.plane_status == "landed"
    raise "Weather is stormy - cannot land" if @stormy == true

    # Change plane_status to "landed"
    plane.landed
    # Add plane to the @ramps array at index idx
    @ramps[idx] = plane
    # Report plane has landed
    p "Plane #{plane} has landed!"
    # Change @airport_status to "full" if now full
    @airport_status = "full" if @ramps.length == airport_capacity
    # Return @ramps
    @ramps
  end

  # Select a plane to take off by @ramps index number
  def take_off(idx)
    # Generate weather status (sunny / stormy)
    #weather
    plane_take_off = @ramps[idx]
    # Raise an error if incorrect/non-existent plane index or weather is stormy
    raise "No plane at this ramp" if plane_take_off == nil
    raise "No ramp at location #{idx}" if idx > @airport_capacity - 1
    raise "Plane is already airborne" if plane_take_off.plane_status == "airborne"
    raise "Weather is stormy - cannot take-off" if @stormy == true
    # Change plane_status to "airborne"
    plane_take_off.airborne
    @ramps[idx] = nil
    # Set @airport_status
    airport_full?
    # Return message
    p "Plane #{plane_take_off} has taken off!"
    plane_take_off
  end

  # Set and return @airport_status
  def airport_full?
    # If there are any nil elements, the airport is not full
    if @ramps.include?(nil)
      @airport_status = "not full"
    else
      @airport_status = "full"
    end
    @airport_status
  end

  def weather
    # 10% chance of stormy weather
    rand() <= 0.9 ? @stormy = false : @stormy = true
    #p "Stormy? #{@stormy}."
  end

end
