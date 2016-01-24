class Weather
  attr_reader :stormy
  
  def initialize
    @stormy = true
  end

  def is_stormy?
    stormy
  end
end
