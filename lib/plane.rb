class Plane

attr_accessor :status

  def initialize(status ="Flying")
    @status = status
  end

  def change_status
    @status = (@status == "Flying" ? "Landed" : "Flying")
    @status
  end

  def landed?
    @status == "Flying" ? false : true
  end

  def flying?
    @status == "Flying" ? true : false
  end

end
