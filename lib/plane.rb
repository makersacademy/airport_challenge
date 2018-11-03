class Plane

  attr_reader :status

  def initialize(status = 'flying')
    @status = status
  end

  def landed?(confirm = 'yes')
    confirm == 'yes' ? (@status = 'Landed') : 'The plane is still flying'
  end

  def taken_off?(confirm = 'yes')
    confirm == 'yes' ? (@status = 'Flying') : 'The plane is in the hangar'
  end

end
