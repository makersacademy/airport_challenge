require 'airport'

describe Airport do
  subject { Airport.new("LHR") }
  let(:flying_plane) { double(:plane, :id => 'BA535', :flying => true) }
  let(:grounded_plane) { double(:plane, :id => 'BA535', :flying => false) }
  let(:plane1) { double(:plane, :id => 'BA501', :flying => true )}
  let(:plane2) { double(:plane, :id => 'BA502', :flying => true )}
  let(:plane3) { double(:plane, :id => 'BA503', :flying => true )}
  let(:plane4) { double(:plane, :id => 'BA504', :flying => true )}
  let(:plane5) { double(:plane, :id => 'BA505', :flying => true )}
  let(:plane6) { double(:plane, :id => 'BA506', :flying => true )}
  let(:plane7) { double(:plane, :id => 'BA507', :flying => true )}
  let(:plane8) { double(:plane, :id => 'BA508', :flying => true )}
  let(:plane9) { double(:plane, :id => 'BA509', :flying => true )}
  let(:plane0) { double(:plane, :id => 'BA500', :flying => true )}
  let(:ten_planes) { [plane1, plane2, plane3, plane4, plane5,
                      plane6, plane7, plane8, plane9, plane0] }
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
      expect(subject.name).to eq "LHR"
    end
  end
  context 'Landing Planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should land a plane if able to do so' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      expect(subject.land(flying_plane)).to be true
    end
    it 'A landed plane should increase the contents of the hanger by 1' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      number_landed_planes = subject.hangar.count
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      expect(subject.hangar.count).to eq number_landed_planes + 1
    end
    it 'A landed plane should now be in the hangar' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      expect(subject.hangar).to include(flying_plane)
    end
    it 'should not land a plane if already landed at this airport' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      expect { subject.land flying_plane }.to raise_error "Plane #{flying_plane.id} Cannot Land. Already Landed!"
    end
    it 'should not land a plane if already landed somewhere else' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      expect { subject.land(grounded_plane) }.to raise_error "Plane #{grounded_plane.id} Cannot Land. Already Landed!"
    end
    it 'should not land a plane if the airport is full' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      ten_planes.each do |p|
        allow(p).to receive(:flying=).with(anything).and_return(anything)
        allow(p).to receive(:location=).with(anything).and_return(anything)
        subject.land(p)
      end
      expect(subject.hangar.count).to eq Airport::DEFAULT_CAPACITY
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      expect { subject.land(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Land. Airport Full!"
    end
    it 'should land a plane if it is stormy' do
      allow(subject).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.land(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Land. Bad Weather!"
    end
  end
  context 'Planes Taking Off' do
    it {is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a plane that is at this airport to take off' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      expect(subject.take_off(flying_plane)).to be true
    end
    it 'Once a plane has taken off, it should decrease the number of landed planes by 1' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      number_landed_planes = subject.hangar.count
      subject.take_off(flying_plane)
      expect(subject.hangar.count).to eq number_landed_planes - 1
    end
    it 'Once a plane has taken off, it should no longer be in the hangar' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      allow(flying_plane).to receive(:location=).with(anything).and_return(anything)
      subject.land(flying_plane)
      allow(flying_plane).to receive(:flying).and_return(false)
      subject.take_off(flying_plane)
      expect(subject.hangar).not_to include(flying_plane)
    end
    it 'Raises an error when trying to instruct an unknown plane to take off' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      expect { subject.take_off(grounded_plane)}.to raise_error "Plane #{grounded_plane.id} Cannot Take Off. Unknown Plane!"
    end
    it 'raises an error when trying to instruct an already flying plane to take off' do
      allow(subject).to receive(:weather_conditions).and_return(:sunny)
      expect { subject.take_off(flying_plane) }.to raise_error "Plane #{flying_plane.id} Cannot Take Off. Already Taken Off!"
    end
    it 'Raises an error when trying to instruct a plane that is in the airport to take off in bad weather' do
      allow(subject).to receive(:weather_conditions).and_return(:stormy)
      allow(flying_plane).to receive(:flying=).with(anything).and_return(anything)
      expect { subject.take_off(grounded_plane) }.to raise_error "Plane #{grounded_plane.id} Cannot Take Off. Bad Weather!"
    end
  end
end
