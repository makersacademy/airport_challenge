require_relative '../lib/airport'
class Plane
  attr_accessor :landed
  def initialize
    @landed = false
  end

  def landed
    @landed = true
  end

  def already_landed?
    @landed ? true : false
  end
end
