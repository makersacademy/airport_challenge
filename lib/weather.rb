class Weather

   attr_reader :stormy

   def initialize
     @conditions = ["sunny", "sunny", "sunny", "sunny", "stormy"]
   end

   def stormy?
     @conditions.sample == "stormy" ? true : false
   end

end
