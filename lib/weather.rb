module Weather

    def weather?
        random = rand(20)
        if random == 1
            return "Stormy"
        else
            return "Clear"
        end
    end

end