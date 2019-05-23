class Plane
attr_reader :flying

  def report_in_flight
    @flying = true
  end

  def flying?
    @flying
  end
end
