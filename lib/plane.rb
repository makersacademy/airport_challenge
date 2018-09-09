require_relative 'airport.rb'
class Plane

attr_accessor :landed, :is_flying

  def initialize
    @landed = false
  end

  def confirm_takeoff
    @is_flying = true
  end

  def takeoff?
     @is_flying = true
  end

  def report_landed
    @landed = true
  end

  def landed?
    @landed
  end


end
