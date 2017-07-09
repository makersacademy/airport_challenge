class Weather

attr_accessor :weather

  def initialize
    if rand(2) == 0
      @weather = 'stormy'
    else
      @weather = 'calm'
    end
  end
end
