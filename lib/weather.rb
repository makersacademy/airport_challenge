class Weather

    def bad?
        bad = rand(1..5)  
        if bad == 1
            true
        else
            false
        end
    end

end