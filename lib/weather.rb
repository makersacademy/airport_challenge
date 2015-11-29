class Weather

attr_reader :conditions

  def initialize
    @conditions = 'sunny'
  end

  def report
    @conditions
  end

  def forecast
    atmosphere <= 7 ? @conditions = 'sunny' : @conditions = 'stormy'
  end

  def atmosphere
    atmos = rand(10)
  end
end
