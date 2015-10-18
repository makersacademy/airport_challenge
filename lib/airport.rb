class Airport

  attr_reader :name, :planes

  def initialize name
    @name = name
    @planes = []
  end

  def full
    full=false
  end

  def weather
    weather=rand(4)
    weather==1 ? 'Stormy' : 'Sunny'
  end

end