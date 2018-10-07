require_relative 'airport'

class Plane

  attr_accessor :broken

  def working?
    !@broken
  end

end
