class Airport
  attr_accessor :weather

  def initialize
    random_variable = rand(0..1)
    random_variable == 1 ? @weather = 'stormy' : @weather = 'clear'
  end

end
