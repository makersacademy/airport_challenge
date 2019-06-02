class Plane

  attr_accessor :status

  PLANE_STATUS = { 0 => "in air", 1 => "grounded" }

  def initialize(status = 0)
    @status = PLANE_STATUS[status]
  end

  def status_report
    @status
  end

  def update
    if @status == PLANE_STATUS[0]
      @status = PLANE_STATUS[1]
    else
      @status = PLANE_STATUS[0]
    end 
  end

end
