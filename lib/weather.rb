class Weather

  attr_reader :stormy

  def initialize  #=> synonym for Class.new. Allows you to pass variables into a class method.
   # weather = Weather.new #=> you would NOT create a new instance of the same class within the blueprint
    @outlook #=> access only within class (if + in attr_reader: give access outside of class)
  end
  
  def random_outlook
    @outlook = [:stormy, :sunny, :sunny].sample
  end
  
  def stormy
    random_outlook
    puts @outlook    
    @outlook == :stormy
  end
end


weather = Weather.new
puts weather.stormy