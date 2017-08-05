class Weather
	
	STATE = [:clear, :stormy].freeze

    def stormy?
        STATE.sample == :stormy
    end

end

