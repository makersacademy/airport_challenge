require 'airport'

describe Airport do
  let(:plane) { double(:plane, :id => 'BA535', :land => true) }
  let(:plane1) { double(:plane, :id => 'BA501', :land => true )}
  let(:plane2) { double(:plane, :id => 'BA502', :land => true )}
  let(:plane3) { double(:plane, :id => 'BA503', :land => true )}
  let(:plane4) { double(:plane, :id => 'BA504', :land => true )}
  let(:plane5) { double(:plane, :id => 'BA505', :land => true )}
  let(:plane6) { double(:plane, :id => 'BA506', :land => true )}
  let(:plane7) { double(:plane, :id => 'BA507', :land => true )}
  let(:plane8) { double(:plane, :id => 'BA508', :land => true )}
  let(:plane9) { double(:plane, :id => 'BA509', :land => true )}
  let(:plane0) { double(:plane, :id => 'BA500', :land => true )}
  let(:ten_planes) { [plane1, plane2, plane3, plane4, plane5,
                      plane6, plane7, plane8, plane9, plane0] }
  context 'Showing the contents of the Hangar' do
    it { is_expected.to respond_to(:hangar)}
  end
  context 'Airport Capacity' do
    it { is_expected.to respond_to(:capacity) }
    it 'Has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  context 'Landing Planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should land a plane' do
      expect(subject.land(plane)).to be true
      expect(subject.hangar).to be_instance_of Array
      expect(subject.hangar.count).to eq 1
      expect(subject.hangar).to include(plane)
    end
    it 'should not land a plane if already landed' do
      subject.land(plane)
      expect { subject.land plane }.to raise_error "Plane #{plane.id} Already Landed!"
    end
    it 'should not land a plane if the airport is full' do

    end
  end
  context 'Planes Taking Off' do
    it {is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a known plane to take off' do
      # First we need to land a plane so we have something to
      # instruct to take off.
      subject.land(plane)
      expect(subject.take_off(plane.id)).to be true
      expect(subject.hangar.count).to eq 0
      expect(subject.hangar).not_to include(plane)
    end
    it 'Raises an error when trying to instruct an unknown plane to take off' do
      expect { subject.take_off(plane)}.to raise_error('Unknown Plane')
    end
  end
end
