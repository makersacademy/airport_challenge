require_relative 'airport'

class Plane

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end



def flying=(value)
  @flying = value
end

end
