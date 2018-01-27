class Plane

  attr_reader :planes_a

  def status
    if @planes_a.include?(self) then
      return "Plane is in the airport"
    else
      return "Plane is flying"
    end
  end

end
