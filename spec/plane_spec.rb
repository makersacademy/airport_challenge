describe plane do

  describe '#landing_status?' do

    it {is_expected.to respond_to (:plane_is_landed?)}

    it 'returns the landing status of landed plane as "true" ' do
      plane = instance_double("plane"), :plane_is_landed? => true)
      expect(plane.plane_is_landed).to eq true
    end

    it 'returns the landing status of non-landed plane as "false" ' do
      plane = instance_double("plane"), :plane_is_landed? => false)
      expect(plane.plane_is_landed).to eq false
    end

  end

end
