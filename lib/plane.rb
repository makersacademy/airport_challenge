require_relative 'airport'
require_relative 'runway'

class Plane

  include Runway
  include Weather

  def report_status(plane)
    plane_is_already_landed?(plane) ? plane_status[:grounded] : plane_status[:airborne]
  end

  private

  def plane_status
    { :airborne => "I'm in the air!",
    :grounded => "I'm on the ground!" }
  end

end
