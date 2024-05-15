require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'should land a plane' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should not land if airport is full' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'should have a default capacity that can be overwritten' do
      airport = Airport.new(2)
      allow(airport).to receive(:weather) { "Sunny" }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'cannot land a plane that is already in an airport' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("This plane is already in the airport")
    end

    it 'should prevent landing when weather is stormy' do
      allow(subject).to receive(:weather) { "Stormy" }
      expect { subject.land(plane) }.to raise_error("Bad weather")
    end
  end

  describe '#take_off' do
    it 'should take off a plane' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'cannot take off a plane that is not in the airport' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error("This plane is not in the airport")
    end

    it 'should prevent taking off when weather is stormy' do
      allow(subject).to receive(:weather) { "Stormy" }
      expect { subject.take_off(plane) }.to raise_error("Bad weather")
    end
  end

  describe '#weather' do
    it "should return 'Sunny' or 'Stormy'" do
      expect(subject.weather).to eq('Sunny').or eq('Stormy')
    end
  end

  describe 'feature tests' do
    subject(:heathrow) { described_class.new(2) }
    let(:airbus_a330) { Plane.new }
    let(:boeing_747) { Plane.new }
    let(:comac_c919) { Plane.new }

    it 'tests the airport is operating properly' do
      # THE WEATHER IS SUNNY
      allow(subject).to receive(:weather) { "Sunny" }
      # LAND AIRBUS A330
      expect { subject.land(airbus_a330) }.to change { subject.planes.size }.by(1)
      expect(subject.planes).to include(airbus_a330)
      # LAND COMAC C919
      expect { subject.land(comac_c919) }.to change { subject.planes.size }.by(1)
      expect(subject.planes).to include(comac_c919)
      # TRY TO LAND BOEING 747 (but airport is full)
      expect { subject.land(boeing_747) }.to raise_error("Airport is full")
      expect(subject.planes).not_to include(boeing_747)
      # TRY TO TAKE OFF BOEING 747 (but the plane isn't in the airport)
      expect { subject.take_off(boeing_747) }.to raise_error("This plane is not in the airport")
      expect(subject.planes).not_to include(boeing_747)
      # TAKE OFF COMAC C919
      expect { subject.take_off(comac_c919) }.to change { subject.planes.size }.by(-1)
      expect(subject.planes).not_to include(comac_c919)
      # THE WEATHER IS STORMY
      allow(subject).to receive(:weather) { "Stormy" }
      # TRY TO LAND BOEING 747 (but there is bad weather)
      expect { subject.land(boeing_747) }.to raise_error("Bad weather")
      expect(subject.planes).not_to include(boeing_747)
      # TRY TO TAKE OFF AIRBUS A330 (but there is bad weather)
      expect { subject.take_off(airbus_a330) }.to raise_error("Bad weather")
      expect(subject.planes).to include(airbus_a330)
      # THE WEATHER IS SUNNY
      allow(subject).to receive(:weather) { "Sunny" }
      # TRY TO LAND AIRBUS A330 (but the plane is already in the airport)
      expect { subject.land(airbus_a330) }.to raise_error("This plane is already in the airport")
      expect(subject.planes).to include(airbus_a330)
    end
  end
end
