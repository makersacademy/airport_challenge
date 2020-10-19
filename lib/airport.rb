# Imports
require_relative 'plane'

class Airport
  # Attribute Readers
  attr_reader :storage, :weather

  # Initialize our stuff
  def initialize(cap = 810_000_00, weather = [true, true, true, true, false].sample)
    @cap = cap
    @storage = []
    @weather = weather
  end

  # Method for landing a plane.
  def land_plane(plane)

    # Guard Clause - Duplicate
    raise "Can't Land - Already Landed" if @storage.include? plane

    # Guard Clause - Weather
    raise "Do Not Land - Bad Weather" unless @weather

    # Guard Clause - Full
    raise "Do Not Land - No Space" unless not_full?

    # Land it
    @storage.push(plane)

  end

  # Fly one plane with that name
  def fly_plane(plane)

    # Guard Clause - Weather
    raise "Do Not Fly - Bad Weather" unless @weather

    # Guard Clause - No Plane
    raise "Can't Fly - No Plane By Name" unless @storage.include? plane

    # Fly
    @storage.delete_at(@storage.find_index(plane))
  end

  # Is it in storage?
  def in_storage?(plane)
    return @storage.include?(plane)
  end

  # Allows setting of the weather externally
  def weather_safe(reply)
    # Gets input from the user to set the weather
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
