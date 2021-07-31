class Weather 
  def initialize
    stormy = stormy?
  end

  def stormy?
    @weather = [true, false, false, false, false, false].sample
  end
end
