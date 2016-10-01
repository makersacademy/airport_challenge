require 'plane_file'

describe Plane do

  describe '#plane_is_landed?' do

    it {is_expected.to respond_to (:plane_is_landed?)}

    it 'returns the landing status of landed plane as "true" ' do
      plane = instance_double("plane", :plane_is_landed? => true)
      expect(plane.plane_is_landed?).to eq true
    end

    it 'returns the landing status of non-landed plane as "false" ' do
      plane = instance_double("plane", :plane_is_landed? => false)
      expect(plane.plane_is_landed?).to eq false
    end
  end

  describe '#proceed_to_land' do
    it {is_expected.to respond_to (:proceed_to_land)}
  end
end
