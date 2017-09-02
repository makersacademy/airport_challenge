require_relative 'airport'
require_relative 'runway'

class Plane

  include Runway

  def report_status
    @@runway.include?(self) ? "I'm on the ground!" : "I'm in the air!"

  end

end
