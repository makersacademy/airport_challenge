class Airport
    def initialise(count)
        @@plane_count = count
    end

    def set_limit(max_planes_new)
        @@plane_limit = max_planes_new
    end

    def plane_limit_check
        if @@plane_count >= @@plane_limit
            true
        else
            false
        end
    end
end