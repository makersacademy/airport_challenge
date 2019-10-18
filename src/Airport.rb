class Airport
    attr_accessor :planes, :status
    def initialize
        @status = "Spaces_Available"
        @planes = []
    end
end