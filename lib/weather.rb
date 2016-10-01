class Weather

  attr_accessor :conditions

  def initialize
    @conditions = conditions
  end

  def conditions
    if rand(4) == 0
      "stormy"
    else
      "sunny"
    end
  end

end
