class Weather
    def stormy?
        Kernel.rand(1..9) > 8
    end
end