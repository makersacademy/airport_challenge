class Plane 

    def initialize
        @flying = true
    end
    
    def status_flying?
      @flying
    end

    def status_landed
      raise 'Plane has already landed' unless status_flying?
      @flying = false
    end

    # def status_takenoff
    #     raise 'Plane has already taken off' if status_flying?
    #     @flying = true
    # end


end
