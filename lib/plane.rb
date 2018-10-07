require_relative 'airport'

class Plane

  attr_accessor :broken
  attr_accessor :status

  def initialize(status = false)
    @status = status
  end

  def update_status
    @status = (@status == "Flying" ? "Landed" : "Flying")
    @status
  end

  def landed?
    @status == "Flying" ? false : true
  end

  def flying?
    @status == "Flying" ? true : false
  end

  def working?
    !@broken
  end

end
