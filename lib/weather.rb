class Weather

attr_accessor :weather
  def initialize
    numbers = { 1 => "sunny", 4 => "stormy", 3 => "sunny", 2 => "sunny", 5 => "sunny", 6 => "sunny"}
    array = numbers.select{|x,y| x == rand(2..6)}.values
    @weather = array.at(0)

  end

end
