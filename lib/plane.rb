require_relative 'airport'

class Plane
  DEFAULT_STATUS = "flying"

  #attr_accessor :status

  def initialize
    @status = DEFAULT_STATUS
  end

  def status
    @status
  end

  def land
    @status = "landed"
  end

  def landed?
    if status == "landed"
      true
    end
  end

end
