class Weather

attr_accessor :bad

    def bad?
        bad = rand(1..3)  
        if bad == 1
            true
        else
            false
        end
    end

end