# frozen_string_literal: true

# A secondary class. Planes interact with Airports (plane.rb)
# is 'require'd in the airport.rb file.
class Plane
  attr_accessor :plane_attributes

  def initialize(plane_id)
    @plane_attributes = {
      plane_id: plane_id,
      airport_id: 'IN TRANSIT/AIR'
    }
  end

  def check_location
    @plane_attributes[:airport_id]
  end
end
