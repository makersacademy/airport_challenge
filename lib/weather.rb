class Weather
  def stormy?
    outlook_sample == :stormy
  end

  private
    OUTLOOK = [:stormy, :sunny, :sunny, :overcast, :overcast].freeze

    def outlook_sample
      OUTLOOK.sample
    end
end
