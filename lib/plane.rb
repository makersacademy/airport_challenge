class Plane

  attr_reader :status

  def initialize(status = 'flying')
    @status = status
  end

  def landed(confirm = 'yes')
    confirm == 'yes' ? (@status = 'landed') : 'The plane is still flying'
  end

  def taken_off(confirm = 'yes')
    confirm == 'yes' ? (@status = 'flying') : 'The plane is in the hangar'
  end

end
