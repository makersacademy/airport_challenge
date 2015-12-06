class Plane

  attr_reader :confirmation

  def status(status = 'flying')
    @confirmation = status
  end

end
