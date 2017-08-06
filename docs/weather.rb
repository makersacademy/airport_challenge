class Weather

def initialize
  @condition
end

attr_reader :condition
attr_accessor :condition

 def weather_condition
p "condition is #{@condition}"
   1.times do
     x = rand 10
     p "right now x is #{x}"
   if x <=8
     p "Sunny"
     @condition == :sunny
     p "condition is #{@condition}"
   else
     p "Stormy"
     @condition == :stormy
     p "condition is #{@condition}"
  end
 end
end
end
