require_relative 'plane'
class Airport
attr_reader :plane_holder
  def storm
   r = Random.new
   r.rand(10) > 8 ? true : false
  end

  def initialize
    @plane_holder= []
  end

  def land(plane)
     if storm
      raise "can't land in a storm"
    else
      @plane_holder << plane
    end
  end

  def landed
    @airport
  end

  def take_off(plane)
    if storm
      raise "can't fly win storm"
    else
       @plane_holder.pop
    end
   end
  end