class Plane

  attr_reader :airbourne

  def initialize
    @airbourne = true
  end

  def landed
    @airbourne = false
  end

  def taken_off
    @airbourne = true
  end

end
