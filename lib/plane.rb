require_relative "flying"

class Plane
  include Flying


  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landing
    @flying = false
  end

  def take_off
    @flying = true
  end

  private

  attr_accessor :flying

end
