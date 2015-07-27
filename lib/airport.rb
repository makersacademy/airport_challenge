require_relative 'weather'

class Airport

  CAPACITY = 10

  def initialize capacity = CAPACITY
    @capacity = capacity 
    @state    = :operating
  end

  def to_sym
    get_state
  end

  def notified_take_off
    self.number_of_planes_on_land -= 1
  end

  def notified_landing
    self.number_of_planes_on_land += 1
  end

  def get_state
    if closed?
      puts "Airport currently not working"

      self.state = :closed
    else
      puts "Airport operating"
      
      self.state = :opering
    end
  end

  private

  attr_accessor :state, :capacity, :weather, :number_of_planes_on_land

  def weather
    @weather = Weather.new
  end

  def closed?
    full? || ( weather.to_sym == :stormy )
  end

  def full?
    number_of_planes_on_land >= capacity
  end

  def number_of_planes_on_land
    @number_of_planes_on_land ||= rand capacity
  end

end
