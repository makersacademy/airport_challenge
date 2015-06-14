require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

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
    return print "\n\n*****   Route assigned   *****\n\n"
  end

  def release_plane plane
    check_the_weather
    fail "\n\n*****   WARNING!! It's stormy, plane is not authorized to take off  *****\n\n".upcase if !@weather
    fail "\n\n*****   Airport is empty   *****\n\n".upcase if empty?
    @planes.pop
    print self.instruct_plane
    print "\n\n*****   Plane taken off, it's sunny   *****\n\n".upcase
    plane.flying

  end

  def landing plane
    check_the_weather
    fail "\n\n*****   Airport is full   *****\n\n".upcase if full?
    fail "\n\n*****   WARNING!! It's stormy, plane is not authorized to landing  *****\n\n".upcase if !@weather
    planes << plane
    print "\n\n*****   Plane landed, it's sunny   *****\n\n".upcase
    plane.landed
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

