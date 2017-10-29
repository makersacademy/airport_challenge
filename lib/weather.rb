class Weather

attr_reader :weather
  def initialize
    numbers = { 1 => "sunny", 2 => "stormy", 3 => "sunny"}
    array = numbers.select{|x,y| x == rand(1..3)}.values
    @weather = array.at(0)

  end

end
