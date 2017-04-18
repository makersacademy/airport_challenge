  #Dependencies
  require_relative 'weather'
  require_relative 'airplane'

class Airport

  #New airport is built, with default capacity of 20
  DEFAULT_CAPACITY = 20

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @tarmac = []
  end

  #Landing checks weather and landing space availability
  #Weather class contains a method >> Good Weather << that creates a boolean that is 10% likely to be false (meaning bad weather)
  def land airplane, forecast = Weather.new.goodweather?
    if forecast == false
      fail "Can't land until skies are clear"
    elsif full?
      fail "Too many planes on the tarmac, assume holding pattern"
    else
      @tarmac.push(airplane)
    end
  end

  #Take off includes weather check
  def takeoff airplane, forecast = Weather.new.goodweather?
    if forecast == false
      fail "Can't get going until skies are clear"
    else
      @tarmac.delete(airplane)
    end
  end

  #An easier to understand function
  def on_tarmac
    @tarmac
  end

  #Interface for basic info
  attr_reader :tarmac
	attr_reader :capacity


  # Tarmac tracker
  private

	def empty?
		@tarmac.length == 0
	end

	def full?
		@tarmac.length == @capacity
	end

end
