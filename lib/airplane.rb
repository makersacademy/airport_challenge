class Airplane

  def initalize airborn = true
    @airborn = airborn
  end

  def land(airport)
    airborn = false
  end

  def airborn?
    @airborn
  end


attr_reader :airborn
attr_writer :airborn

end
