class Weather
  def initialize
  @weather =  Random.rand(1..100)
 end

def stormy?
@weather<20
end

end
