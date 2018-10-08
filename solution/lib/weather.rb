class Weather

attr_accessor :condition

  def initialize
   conditions = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
    @condition = conditions[rand(conditions.length)]
  end

end


#1. array and sample
#2. random number and case 
