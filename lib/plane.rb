# Unit tests (planes):

# - New plane can be created
# - Plane is created with status 'flying', and location 'mid-air'
# - Plane status changes to 'landed' when landed, location changes to 'in-hangar'
# - Plane can land/take-off from airport
# - Plane cannot land when airport is full
# - Plane cannot land/take-off unless weather is 'sunny'
# - Responds to land request, unless landed
# - Responds to take-off, unless flying

require_relative 'airport'

class Plane

  def flying?
    true
  end

  def landed
    true
  end

  def plane_status
  end

end
