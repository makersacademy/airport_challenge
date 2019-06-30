require 'airport'

describe Airport do
  describe '#plane_land' do
    it 'lands a plane at the airport' do
      expect(subject).to respond_to(:plane_land).with(2).argument
    end

    it 'Storm. Plane cannot land' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(true)
      plane = double(:plane)
      expect { subject.plane_land(plane, weather)}.to raise_error 'Landing prevented due to storm'
    end

    it 'Airport full. Unable to land' do
        airport = Airport.new(20)
        plane = double(:plane)
        weather = double(:weather)
        allow(weather).to receive(:stormy?).and_return(false)

        20.times { airport.plane_land(plane, weather) }
        expect{ airport.plane_land(plane, weather)}.to raise_error 'Airport is full'
    end
  end

  describe '#plane_depart' do
    it 'releases parked planes' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      subject.plane_land(:plane, weather)
      expect(subject).to respond_to(:plane_depart).with(2).argument
    end

    it 'raises error if plane no longer at airport' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      subject.plane_land(plane, weather)
      subject.plane_depart(plane, weather)
      expect { subject.plane_depart(plane, weather) }.to raise_error 'Plane no longer here'
    end

    it 'Storm. Plane cannot depart' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(true)
      plane = double(:plane)
      expect {subject.plane_depart(plane, weather)}.to raise_error 'Takeoff prevented due to storm'
    end
  end
end
