class Airplane

attr_accessor :flying

  def initialize 
    @flying = false
  end 

  def fly
    @flying = true
  end

  def land
    @flying = false
  end


end