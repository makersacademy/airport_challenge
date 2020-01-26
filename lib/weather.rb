class Weather

    def stormy?
        generator == :stormy
    end

    private
    def generator
        [:sunny, :sunny, :sunny, :stormy].sample
    end
    
end