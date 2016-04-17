class Plane
  def initialize
    @landed = false
  end
    def took_off?
      @landed = false
    end

    def landed?
      @landed
    end

  def reported_landed
    @landed = true
  end
    private
  attr_reader :landed
end
