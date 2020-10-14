class Plane
    @@last_id = 0

    def initialize(id = @@last_id + 1)
        @@last_id += 1
        @id = id
    end

    def get_id
        return @id
    end

end
