class Plane

  def initialize
    @status = false
  end

  def report_status(status)
    if status == true
      @status = true
    end
  end

  def flying?
    @status
  end

end
