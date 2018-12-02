require_relative 'airport'

class Plane

  attr_accessor :broken
  attr_accessor :status

# start with false - links to update_status and intialises planes in air
  def initialize(status = false)
    @status = status
  end

  def update_status
    @status = (@status == "In Air" ? "Landed" : "In Air")
    @status
  end

  def landed
    @status != "In Air"
  end

  def in_air
    @status == "In Air"
  end

  def working
    !@broken
  end

end
