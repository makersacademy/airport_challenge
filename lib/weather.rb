class Weather
  attr_reader :stormy, :conditions
  # CONDITION = ["stormy", "sunny", "stormy"]

  # def initialize
  #   @stormy = false
  # end 

  def conditions
    ["stormy", "sunny", "sunny", "sunny"].sample
  end 
  
  def stormy?
    conditions == "stormy"
  end
end
