require_relative 'airport'
require_relative 'runway'

class Plane

  include Runway

  def report_status(plane)
    "I'm in the air!" unless @@runway.include?(plane)
  end

end
