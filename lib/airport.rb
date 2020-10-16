# Imports
require_relative 'plane'

class Airport
  # Attribute Readers
  attr_reader :storage

  # Initialize our stuff
  def initialize()
    @storage = []
  end

  # Method for landing a plane.
  def land_plane(plane)
    @storage.push(plane)
  end

  # Fly one plane with that name
  def fly_plane(plane)
    @storage.delete_at(@storage.find_index(plane))
  end

  # Is it in storage?
  def in_storage?(plane)
    return (if @storage.include?(plane) then true else false end)
  end


end
