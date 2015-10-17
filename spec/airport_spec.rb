require 'airport'

describe Airport do
  let(:airport_name) { "LHR" }
  subject { Airport.new(airport_name) }
  let(:flying_plane) { double(:plane, :id => 'BA535', :flying => true) }
  let(:grounded_plane) { double(:plane, :id => 'BA535', :flying => false) }

  before(:each) do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
  end
  context 'Showing the contents of the Hangar' do
    it { is_expected.to respond_to(:hangar)}
    it 'should return an array when asked for the contents of the hangat' do
      expect(subject.hangar).to be_instance_of Array
    end
  end
  context 'Airport Capacity' do
    it { is_expected.to respond_to(:capacity) }
    it 'Has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'Can have a different capacity than the default if configured' do
      airport = Airport.new("NYC", Airport::DEFAULT_CAPACITY+1)
      expect(airport.capacity).not_to eq Airport::DEFAULT_CAPACITY
    end
  end
  context 'An airports name' do
    it { is_expected.to respond_to(:name) }

    it 'Returns its name when asked' do
      expect(subject.name).to eq airport_name
    end
  end
  context 'Weather Conditions' do
    it { is_expected.to respond_to(:weather_conditions) }
    it 'Weather conditions are either sunny or stormy' do
      expect(subject.weather_conditions).to satisfy {|value| [:stormy, :sunny].include? value}
    end
  end
  context 'Landing Planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should land a plane if able to do so' do
      expect(subject.land(flying_plane)).to be true
    end
    it 'A landed plane should increase the contents of the hanger by 1' do
      number_landed_planes = subject.hangar.count
      subject.land(flying_plane)
      expect(subject.hangar.count).to eq number_landed_planes + 1
    end
    it 'A landed plane should now be in the hangar' do
      subject.land(flying_plane)
      expect(subject.hangar).to include(flying_plane)
    end
    it 'should not land a plane if already landed at this airport' do
      subject.land(flying_plane)
      expect { subject.land flying_plane }.to raise_error "Plane #{flying_plane.id} Cannot Land. Already Landed!"
    end
    it 'should not land a plane if already landed somewhere else' do
      expect { subject.land(grounded_plane) }.to raise_error "Plane #{grounded_plane.id} Cannot Land. Already Landed!"
    end
    it 'should not land a plane if the airport is full' do
      subject.capacity.times do |index|
        current_plane = double(:plane, :id => 'BA5' + index.to_s, :flying => true)
        allow(current_plane).to receive(:flying=).with(anything).and_return(anything)
        allow(current_plane).to receive(:location=).with(anything).and_return(anything)
        subject.land(current_plane)
      end
      expect(subject.hangar.count).to eq subject.capacity
      expect { subject.land(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Land. Airport Full!"
    end
    it 'should not land a plane if it is stormy' do
      allow(subject).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.land(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Land. Bad Weather!"
    end
  end
  context 'Planes Taking Off' do
    it {is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a plane that is at this airport to take off' do
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      allow(flying_plane).to receive(:location).and_return(airport_name)
      expect(subject.take_off(flying_plane)).to be true
    end
    it 'Once a plane has taken off, it should decrease the number of landed planes by 1' do
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      allow(flying_plane).to receive(:location).and_return(airport_name)
      number_landed_planes = subject.hangar.count
      subject.take_off(flying_plane)
      expect(subject.hangar.count).to eq number_landed_planes - 1
    end
    it 'Once a plane has taken off, it should no longer be in the hangar' do
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      allow(flying_plane).to receive(:location).and_return(airport_name)
      subject.take_off(flying_plane)
      expect(subject.hangar).not_to include(flying_plane)
    end
    it 'Raises an error when trying to instruct a plane to take off from another airport' do
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      allow(flying_plane).to receive(:location).and_return("NYC")
      expect { subject.take_off(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Take Off. Wrong Airport #{flying_plane.location}"

    end
    it 'Raises an error when trying to instruct an unknown plane to take off' do
      expect { subject.take_off(grounded_plane)}.to raise_error "Plane #{grounded_plane.id} Cannot Take Off. Unknown Plane!"
    end
    it 'raises an error when trying to instruct an already flying plane to take off' do
      expect { subject.take_off(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Take Off. Already Taken Off!"
    end
    it 'Raises an error when trying to instruct a plane that is in the airport to take off in bad weather' do
      allow(subject).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.take_off(grounded_plane) }.to raise_error "Plane #{grounded_plane.id} Cannot Take Off. Bad Weather!"
    end
  end
end
