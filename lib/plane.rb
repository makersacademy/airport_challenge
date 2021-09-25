class Plane 
  attr_accessor :grounded

  def initialize(status = "undecided")
    if status == "grounded"
      @grounded = true
    elsif status == "in flight"
      @grounded = false
    else
      @grounded = status
    end
  end  

  def land 
    raise "This plane is already at an airport" if @grounded == true
    @grounded = true
  end

  def take_off
    raise "This plane is already in the sky" if @grounded == false 
    @grounded = false 
  end 
end 
