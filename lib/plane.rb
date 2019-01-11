class Plane

  attr_reader :state

  def initialize
    @state = ""
  end

  def is_grounded
    @state = "grounded"
  end

  def is_flying
    @state = "flying"
  end

end
