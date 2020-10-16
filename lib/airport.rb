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

end
