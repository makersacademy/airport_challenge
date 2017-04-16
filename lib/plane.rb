require_relative 'airport.rb'
class Plane

  def initialize
    @status = 0
  end

  def landed?
    true if @status.nonzero?
  end

  def ground
    @status = 1
  end

  def on_air?
    true if @status.zero?
  end

  def flying
    @status = 0
  end

end
