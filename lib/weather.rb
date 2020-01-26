module Weather

    def self.forecast(seed = Random.new_seed)
        rando = Random.new(seed)
        num = rando.rand(2) 
        array = ["stormy", "calm"]
        array[num]
    end
end
