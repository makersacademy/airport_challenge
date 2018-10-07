# This is a weather class that generates random conditions
class Weather

  attr_reader :conditions

  def forcast
    @conditions = rand(6)
    case @conditions
    when 0, 1, 2, 3, 4, 5
      false # Good weather senarios
    when 6
      true # bad weather scenarios
    end
  end
  
end
