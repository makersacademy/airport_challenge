require_relative 'airport'

class Plane
  attr_reader :flying_status , :airport_status

  def initialize
    @flying_status = true
  end

  def landed?
    @flying_status = false
  end

  def took_off?
    @flying_status = true 
  end




end
