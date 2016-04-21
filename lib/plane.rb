class Plane
  def initialize
    @landed = true
  end
    def took_off
      @landed = false
    end

    def landed
      @landed = true
    end

    def landed?
      @landed
    end


  #   private
  # attr_reader :landed
end
