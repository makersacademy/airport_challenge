class Plane

  attr_accessor :flying, :landed

  def initialize
    @landed = false
  end

    def landed
      @landed = true
    end

    def flying
      @landed = false
    end

end
