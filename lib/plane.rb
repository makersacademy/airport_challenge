class Aircraft

  attr_reader :status

  def land
    @status = "landed"
  end

  def takeoff
    @status = "airbourne"
  end

end
