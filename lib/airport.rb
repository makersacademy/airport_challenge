require_relative 'airplane'

class Air_Port
  attr_reader :capacity, :airplanes
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airplanes = []
  end

  def set_capacity
    input_capacity = gets.chomp
    if input_capacity.empty?
      @capacity
    else
      @capacity = input_capacity
    end
  end

  def land_plane(airplane)
  #  fail "Too stormy to land" if stormy
    fail "Full Capacity reached, no landing!" if full?
    @airplanes << airplane
    confirm_landing
  end

  def confirm_landing
    true
  end

  def instruct_take_off(airplane)
  #  fail "Too stormy to take off" if stormy
  #confirm_takeoff
  end

  def confirm_takeoff
    #true
  end
  #weather methods?

  private
  def stormy?
    #@bikes.count >= DEFAULT_CAPACITY
  end

  def full?
    @airplanes.count >= DEFAULT_CAPACITY
  end
end
