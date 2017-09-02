require_relative 'airport'
require_relative 'runway'

class Plane

  include Runway

  def report_status
    if @@runway.include?(self)
      "I'm on the ground!"
    else
      "I'm in the air!"
    end
  end

end
