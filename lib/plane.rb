class Plane

  attr_reader :flying

    def initialize (flying = false)
      @flying = flying
    end

    def flying
      @flying = true
    end

  def grounded
    @flying = false
  end

end
