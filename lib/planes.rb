class Planes
  attr_reader :status

  def take_off
    @status = 'in air'
  end

  def land
    @status = 'landed'
  end

  def confirm_status
  end
end
