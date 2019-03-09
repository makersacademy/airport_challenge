class Airport

  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def land(plane)
    @plane_list << plane
  end

  def take_off(plane)
    if empty? == false
      @plane_list.pop 
    end
  end

  def empty?
    @plane_list.empty?
  end
  
end
