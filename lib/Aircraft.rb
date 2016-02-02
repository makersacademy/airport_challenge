require_relative 'Airport'

class Aircraft
  attr_accessor :on_ground

  def initialize
    @on_ground = false
  end

  def landed?
    @on_ground
  end

  def report_landed
    @on_ground = true
  end

  def report_take_off
    @on_ground = false
  end

  def status
    if @on_ground == true
      return 'STATUS: LANDED'
    else
      return 'STATUS: IN FLIGHT'
    end
  end

end
