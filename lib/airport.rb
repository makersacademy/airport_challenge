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
    #puts "plane landed"
  end

  def confirm_landing
    #if in array "landed" else raise_error
    fail "Plane has not landed" if not_landed
    puts "plane landed"
  end

  def instruct_take_off(airplane)
  #  fail "Too stormy to take off" if stormy
    @airplanes.delete(airplane)
  end

  def confirm_takeoff
  end

  private
  def stormy?
  end

  def full?
    @airplanes.count >= DEFAULT_CAPACITY
  end

  def not_landed
    @airplanes.include?
  end

  def not_takenoff
  end
end
