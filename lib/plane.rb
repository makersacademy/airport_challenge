class Plane
  attr_reader :flying
  attr_writer :flying

  def initialize
    self.flying = true
  end

  def land
    fail 'Plane has already landed' if landed?
    self.flying = false
    self
  end

  def take_off
    fail 'Plane cannot take off when flying' if flying?
    self.flying = true
    self
  end

  def flying?
    flying
  end

  def landed?
    !flying
  end

end
