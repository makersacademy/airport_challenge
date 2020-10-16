# Imports
require_relative 'plane'

class Airport
  # Attribute Readers
  attr_reader :storage

  # Initialize our stuff
  def initialize(cap = 810_000_00)
    @cap = cap
    @storage = []
  end

  # Method for landing a plane.
  def land_plane(plane)

    # Guard Clause - Full
    raise "Do Not Land - No Space" unless not_full?

    # If there is space, land it.
    @storage.push(plane) if not_full?

  end

  # Fly one plane with that name
  def fly_plane(plane)
    @storage.delete_at(@storage.find_index(plane))
  end

  # Is it in storage?
  def in_storage?(plane)
    return (@storage.include?(plane) ? true : false)
  end

  # Private Methods
  private

  def not_full?
    @storage.length != @cap
  end

end
