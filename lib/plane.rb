class Plane
  attr_reader :is_flying

  def initialize(flying = true)
    @is_flying = flying
  end

  def landed
    self.is_flying = false
  end

  def taken_off
    self.is_flying = true
  end

  private

  attr_writer :is_flying

end
