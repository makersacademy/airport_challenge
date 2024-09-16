class Weather 
    def bad?
        bad = rand(1..70)
        return true if bad <= 10
        false
    end
end