require_relative 'weather'
require_relative 'airplane'

class Airport

DEFAULT_CAPACITY = 20

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @tarmac = []
  end

  def land(airplane, forecast = Weather.new.goodweather?)
    if forecast == false
      fail "Can't land until skies are clear"
    elsif full?
      fail "Too many planes on the tarmac, assume holding pattern"
    else
      @tarmac.push(airplane)
    end
  end

  def takeoff(airplane, forecast = Weather.new.goodweather?)
    if forecast == false
      fail "Can't get going until skies are clear"
    else
      @tarmac.delete(airplane)
    end
  end

  def on_tarmac
    @tarmac
  end

  attr_reader :tarmac
	attr_reader :capacity

  private

	def empty?
		@tarmac.length == 0
	end

	def full?
		@tarmac.length == @capacity
	end

end
