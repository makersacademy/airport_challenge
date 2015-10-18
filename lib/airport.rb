class Airport

  attr_reader :name

  def initialize name
    @name = name
  end

  def full
    full=false
  end

  def weather
    weather=rand(4)
    weather==1 ? 'Stormy' : 'Sunny'
  end

end