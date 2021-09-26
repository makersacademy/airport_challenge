class Weather
    
  def initialize 
    @storm = [true, false]
  end
  
  def storm
    @storm.sample
  end
  
end
