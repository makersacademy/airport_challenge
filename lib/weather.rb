class Weather
  attr_reader :condition
  @@conditions = ['good', 'stormy', 'good', 'good', 'good']
  def initialize
    @condition = @@conditions.sample
  end
end
