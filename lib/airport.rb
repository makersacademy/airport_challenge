class Airport
    attr_reader :airport_full 
    attr_reader :capasity

    def initialize (capasity = 30, default = true)
        @airport_full = default  
        @capasity = capasity
    end
end