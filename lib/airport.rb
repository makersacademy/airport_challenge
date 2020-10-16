# Imports
require_relative 'plane'

class Airport
  # Attribute Readers
  attr_reader :storage, :weather

  # Initialize our stuff
  def initialize(cap = 810_000_00)
    @cap = cap
    @storage = []
    @weather = true
  end

  # Method for landing a plane.
  def land_plane(plane)

    raise "Do Not Land - Bad Weather" unless @weather

    # Guard Clause - Full
    raise "Do Not Land - No Space" unless not_full?

    # If there is space, land it.
    @storage.push(plane) if not_full? and @weather

  end

  # Fly one plane with that name
  def fly_plane(plane)
    raise "Do Not Fly - Bad Weather" unless @weather

    @storage.delete_at(@storage.find_index(plane)) if @weather
  end

  # Is it in storage?
  def in_storage?(plane)
    return (@storage.include?(plane) ? true : false)
  end

  def weather_safe(reply)
    @weather = reply
  end

  # Private Methods
  private

  def not_full?
    @storage.length != @cap
  end

  def weather_good?
    @weather
  end

end
