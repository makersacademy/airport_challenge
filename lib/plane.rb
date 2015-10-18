class Plane

  attr_accessor :flying, :landed

  def initialize
    @landed = true
  end

    def landed
      @landed = true
    end

    def flying
      @landed = false
    end

end
