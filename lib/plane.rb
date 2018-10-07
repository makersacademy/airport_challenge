require_relative 'airport'

class Plane

  attr_accessor :status

  def initialize(status = false)
    @status = status
  end

  def update_status
    @status = (@status == "Flying" ? "Landed" : "Flying")
    @status
  end

  def landed?
    @status == "Landed"
  end

  def flying?
    @status == "Flying"
  end

end
