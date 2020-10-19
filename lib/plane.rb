class Plane
    attr_reader :id
    @@last_id = 0

    def initialize()
        @@last_id += 1
        @id = @@last_id
    end

end
