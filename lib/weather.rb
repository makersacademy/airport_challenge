class Weather

  attr_reader :stormy

  def initialize (1,2,3,4) #=> synonym for Class.new. Allows you to pass variables into a class method.
   # weather = Weather.new #=> you would NOT create a new instance of the same class within the blueprint
    @outlook #=> access only within class (if + in attr_reader: give access outside of class)
  end
  
  def random_outlook(2)
    @outlook = [:stormy, :sunny, :sunny].sample
  end
  
  def stormy(1,3)
    random_outlook
    puts "-------------------"
    puts @outlook
    puts "-------------------"
    @outlook == :stormy
  end
end


weather = Weather.new
puts weather.stormy