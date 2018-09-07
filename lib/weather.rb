class Weather
  attr_reader :condition

  def initialize
    conditions = ['sunny','stromy']
    @condition = conditions[rand(0..1)]
  end
end
