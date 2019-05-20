class Weather 
  attr_accessor :stormy
  
  def initialize 
    @stormy = false
  end

  def report(weather)
    case weather
    when 1
      'stormy'
    when 2 
      'clear'
    end
  end

  def stormy?
    conditions = rand(1..3)
    @stormy = report(conditions) == 'stormy' 
  end
end

