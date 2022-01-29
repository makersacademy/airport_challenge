class Airport
    attr_reader :planes
  def initialize 
    @planes = []
  end

  def land
   p @planes << planes
   p @planes
  end

  def take_off
    if true 
        puts "In the air"
    else
        puts "At airport"
    end

  end

end
