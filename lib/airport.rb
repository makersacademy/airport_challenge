require_relative "./plane.rb"

class Airport
  attr_accessor :hanger

  def initialize
    @hanger = []
  end
# initailize with weather?
# check plane for weather?
# generate new instance of weather Class to know weather?

  def good_weather?
    [false, true].sample
  end
  
end
