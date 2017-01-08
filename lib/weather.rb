class Weather

attr_reader :status


  def initialize
    rand(100) <= 5 ? @status = "stormy" : @status = "sunny"
  end


end
