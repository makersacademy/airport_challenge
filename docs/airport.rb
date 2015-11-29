require './lib/plane.rb'

class Airport

  attr_reader :planes

  attr_accessor :capacity, :sunny #Ultimately the air traffic controller has the
                                  #ability to override current weather conditions

  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @sunny = true
    @capacity = capacity
  end

  def land(plane)
    if plane.flying == false
        raise "That plane has already landed!"
    else
      if @sunny
        if full?
          raise "This airport is full, please redirect to closest airport"
        else
          if planes.include?(plane)
            raise "That plane has already landed!"
          else
            plane.flying = false
            planes << plane
          end
        end
      else
        raise "Weather is too dangerous to land!"
      end
    end
  end

  def take_off(x)
    if @sunny
      if empty?
        raise "There are no planes in the airport!"
      else
        planes[x - 1].flying = true
        planes.delete(planes[x - 1])
      end
    else
      raise "Weather is too dangerous to depart!"
    end
  end

  def weather_report
    @report = rand(5)
    if @report < 2
      @sunny = false
      "Looks like there's a storm a-brewin'!"
    else
      @sunny = true
      "Sky's all clear from here"
    end
  end

private

  def full?
    planes.length >= capacity ? true : false
  end

  def empty?
    planes.empty? ? true : false
  end

end
