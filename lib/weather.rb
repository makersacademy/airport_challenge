class Weather

    def bad?
        bad = rand(1..20)  
        return true if bad == 1
        false
    end

end