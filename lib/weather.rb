class Weather
  
  def initialize
    @sky = []
  end

  def ok?
    skies = ["clear", "stormy"]
    
    rand(10) == 9 ? @sky << skies[1] : @sky<< skies[0]

    @sky[0]
  end
end

@weather = Weather.new