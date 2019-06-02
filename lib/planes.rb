class Planes
  attr_reader :flying

  def inintialize
    @flying = true
  end

  def taken_off
    @flying = true
  end

  def landed
    @flying = false
  end

=begin
  def taken_off
    @flying = true
  end

  def taken_off?
    @flying
  end
=end
end
