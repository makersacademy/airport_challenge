require 'plane_file'

describe Plane do

  describe '#plane_is_landed?' do

    it {is_expected.to respond_to (:plane_is_landed?)}

    it 'returns the landing status of landed plane as "true" ' do
      test_plane = Plane.new(true)
      expect(test_plane.plane_is_landed?).to eq true
    end

    it 'returns the landing status of non-landed plane as "false" ' do
      test_plane = Plane.new(false)
      expect(test_plane.plane_is_landed?).to eq false
    end
  end

  describe '#proceed_to_land' do
    it {is_expected.to respond_to (:proceed_to_land)}

    it 'plane undertakes landing procedure' do
      airport = Airport.new
      test_plane = Plane.new
      test_plane.proceed_to_land(airport)
      expect(test_plane).to be_plane_is_landed
    end
  end
end
