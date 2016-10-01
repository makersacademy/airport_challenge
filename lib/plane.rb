require_relative 'airport'

class Plane

attr_accessor :flying
attr_accessor :status

  def flying?
    flying
  end

  def status?
    if plane.flying = true
      status = 'flying'
    else plane.flying = false
      status = 'landed'
    end
  end


end
