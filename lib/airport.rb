require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5
  # DEFAULT_WEATHER = true

  attr_accessor :capacity

  def initialize
    @planes=[]
    @capacity = DEFAULT_CAPACITY
    @weather = true
  end

  def check_the_weather
    random = rand(3)
    @weather = random == 1 ? false : true
    @weather
  end


  def instruct_plane
    return print "\n\n*****   Route assigned, weather is sunny, plane authorized to take off   *****\n\n".upcase if @weather
    return print "\n\n*****   WARNING!! Weather is stormy, plane is not authorized to take off   *****\n\n".upcase if !@weather
  end

  def release_plane
    fail "\n\n*****   WARNING!! Weather is stormy, plane is not authorized to take off  *****\n\n".upcase if !@weather
    fail "\n\n*****   Airport is empty   *****\n\n".upcase if empty?
    @planes.pop
  end

  def landing plane
    fail "\n\n*****   Airport is full   *****\n\n".upcase if full?
    fail "\n\n*****   WARNING!! Weather is stormy, plane is not authorized to landing  *****\n\n".upcase if !@weather
    planes << plane
  end


  private

  attr_reader :planes

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= @capacity
  end


end

