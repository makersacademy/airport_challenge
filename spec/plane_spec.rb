require 'plane'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}

  describe '#land' do
    it 'lands self at an airport' do
      airport = double('airport',:planes => [])
      allow(airport).to receive(:weather)
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end

    it 'raises an error when airport.weather is stormy' do
      airport = double('airport',:planes => [])
      allow(airport).to receive(:weather){"stormy"}
      expect{subject.land(airport)}.to raise_error "It's stormy here. Cannot land at this airport"
    end
  end

  describe '#take_off' do

    it 'takes off from its current airport' do
      current_airport = double('airport', :planes => [])
      allow(current_airport).to receive(:weather)
      plane = Plane.new
      plane.land(current_airport)
      plane.take_off
      expect(current_airport.planes).to eql([])
    end

    it 'confirms self is no longer at the airport' do
      current_airport = double('airport', :planes => [])
      allow(current_airport).to receive(:weather)
      plane = Plane.new
      plane.land(current_airport)
      expect{plane.take_off}.to output('Plane has left airport').to_stdout
    end
  end

end
