class Plane

  def initialize
    @landed = false
  end

def report_landed
  @landed = true
end

private

attr_reader :landed

def landed?
  @landed
end

end
