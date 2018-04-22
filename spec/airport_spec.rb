require 'airport'

describe Airport do
  DEFAULT_CAPACITY = 5
  let(:plane) { double :plane, flying: true, land: false }
  let(:plane_in_airport) { double :plane, flying: false, take_off: true }
  let(:weather) { double :weather, condition: "clear" }

  describe '#lands_a_plane' do
    it 'shows plane in airport once it has landed' do
      subject.lands_a_plane(plane, weather)
      expect(subject.planes.include?(plane)).to eq true
    end

    it 'shows plane not in the airport because weather is stormy' do
      allow(weather).to receive(:condition) { "stormy" }
      expect { subject.lands_a_plane(plane, weather)
      }.to raise_error("Weather is stormy. Plane cannot land.")
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'shows plane not in the airport when airport is full' do
      subject.planes.concat [plane_in_airport, plane_in_airport,
        plane_in_airport, plane_in_airport, plane_in_airport]
      expect { subject.lands_a_plane(plane, weather)
      }.to raise_error("Airport is full. Plane cannnot land.")
      expect(subject.planes.include?(plane)).to eq false
    end
  end

  describe '#instructs_takeoff' do
    it 'shows plane no longer in airport once it has taken off' do
      subject.planes << plane_in_airport
      subject.instructs_takeoff(plane_in_airport, weather)
      expect(subject.planes.include?(plane_in_airport)).to eq false
    end

    it 'shows plane is still in the airport because weather is stormy' do
      subject.planes << plane_in_airport
      allow(weather).to receive(:condition) { "stormy" }
      expect { subject.instructs_takeoff(plane_in_airport, weather)
      }.to raise_error("Weather is stormy. Plane cannot take off.")
      expect(subject.planes.include?(plane_in_airport)).to eq true
    end
  end
end
