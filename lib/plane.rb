require_relative 'airport'

class Plane
  DEFAULT_STATUS = "flying"

  attr_reader :status

  def initialize
    @status = DEFAULT_STATUS
  end

  def land
    @status = "landed"
  end

  def fly
    @status = "flying"
  end

  def flying?
    @status == "flying"
  end

  def landed?
    @status == "landed"
  end
end
