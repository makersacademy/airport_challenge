class Weather
  attr_reader :sky

  def initialize
    @sky = []
  end

  def ok?
    skies = ["clear", "stormy"]
    
   if  rand(10) == 9 
    @sky << skies[1]
    @sky[0] 
   else 
    @sky << skies[0]
    @sky[0]
   end
  end
end

