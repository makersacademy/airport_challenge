class Airport


  attr_reader :hangar

DEFAULT = 20
  def initialize(capacity=DEFAULT)
    @capacity = capacity
    @hangar = []
  end

  def add_plane(plane)
    
   @hangar.count == @capacity ? raise("the airport is full") : @hangar.push(plane)
  end

  def release_plane
    #@hangar.empty? is equivalent to @hangar != nil
    @hangar.pop
  end

  def weather
    # weather = rand("stormy", "sunny", "rainy", "windy")
    weather = rand(3)
    if weather == 0
      return "stormy"
    elsif weather == 1
      return "sunny"
    elsif weather == 2
      return "rainy"
    elsif weather == 3
      return "windy"
    end
  end

  def stop_plane(plane)
    if weather == "stormy"
      puts "too stormy"
    else @hangar.push(plane)
    end
  end
    def stop_landing(plane)
      if weather == "stormy"
        puts "too stormy"
      else @hangar.pop
      end

  end
end
