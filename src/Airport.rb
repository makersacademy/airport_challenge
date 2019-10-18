class Airport
    attr_accessor :planes, :status, :max_planes, :weather
    def initialize(plane_count)
        @max_planes = plane_count
        @weather = "Clear"
        @status = "Spaces_Available"
        @planes = []
    end
    def GetStatus
        if @planes.count + 1 > @max_planes
            @status = "Full"
        else
            @status = "Spaces_Available"
        end
        return @status
    end
end