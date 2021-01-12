# understanding plane objects
class Plane
  attr_reader :state

  def initialize
    @state = "flying"
  end

  def flying
    @state = "flying"
  end
end
