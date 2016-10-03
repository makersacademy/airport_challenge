
class Plane

  attr_accessor :flying


  def initialize
    @flying = true
  end

  def flying?
    return true if @flying
  end

end
