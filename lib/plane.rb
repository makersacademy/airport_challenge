class Plane

  def take_off(airport)
    airport.remove(self)
    @status = {message: "Has taken off", airport: airport}
  end

  def land(airport)
    airport.add(self)
    @status = {message:"Landed", airport: airport}
  end

  def status
    if @status[:message] == "Has taken off"
      @status[:message] + " from airport "+ @status[:airport].to_s
    elsif @status[:message] == "Landed"
      @status[:message] + " at airport " + @status[:airport].to_s
    else
      "Not in operation"
    end
  end

end
