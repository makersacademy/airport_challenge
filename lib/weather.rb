class Weather

  attr_accessor :conditions

  def initialize
    @conditions = conditions
  end

  def conditions
    rand(4) == 0 ? "stormy" : "sunny"
  end

end
