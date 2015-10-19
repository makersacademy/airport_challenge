require 'airport'

describe Airport do

  it 'initializes with a default capacity of 50' do
    expect(subject.capacity).to eq 50
  end

  context 'When using a different capacity from the default' do
    subject {Airport.new(30)}
    it 'takes on a the capacity supplied by the user' do
      expect(subject.capacity).to eq 30
    end
  end

  context 'In sunny weather:' do
    before(:each) {allow(subject).to receive(:weather?).and_return(:sunny)}
    context 'Taking off' do

      it 'successfully instructs a plane to take off' do
        plane_double = double(:fly => nil, :flying_status => nil, :dont_fly => nil)
        subject.plane_land(plane_double)
        subject.plane_take_off(plane_double)
        expect(subject.in_this_airport?(plane_double)).to eq false
       end

      it 'does not allow a flying plane to take off' do
        plane_double = double(:flying_status => true, :dont_fly => nil)
        subject.plane_land(plane_double)
        expect{subject.plane_take_off(plane_double)}.to raise_error 'a flying plane cannot take off'
      end

      it 'raises an error when the plane_take_off method is called on an empty airport' do
        expect{subject.plane_take_off(double)}.to raise_error 'there are no planes in the airport'
      end
    end

    context 'Landing' do
      it 'successfully instructs a plane to land' do
        plane_double = double(:flying_status => true, :dont_fly => nil)
        subject.plane_land(plane_double)
        expect(subject.in_this_airport?(plane_double)).to eq true
      end

      it 'does not allow a non-flying plane to land' do
        plane_double = double(:flying_status => false)
        expect{subject.plane_land(plane_double)}.to raise_error 'a non-flying plane cannot land'
      end

      it 'raises an error when a plane tries to land in an airport that is already at full capacity' do
        Airport::DEFAULT_CAPACITY.times {subject.plane_land(double(:flying_status => true,  :dont_fly => nil))}
        expect {subject.plane_land(double(:flying_status => true,  :dont_fly => nil))}.to raise_error 'the plane cannot land because the airport is full'
      end
    end
  end

  context 'In stormy weather:' do

    it 'raises an error when a plane tries to land in stormy weather' do
      allow(subject).to receive(:weather?).and_return(:stormy)
      expect {subject.plane_land(double)}.to raise_error 'the plane cannot land as the weather is stormy'
    end


    it 'raises an error when a plane tries to take off in stormy weather' do
      allow(subject).to receive(:weather?).and_return(:sunny)
      subject.plane_land(double(:dont_fly => nil, :flying_status => true))
      allow(subject).to receive(:weather?).and_return(:stormy)
      expect {subject.plane_take_off(double)}.to raise_error 'the plane cannot take off as the weather is stormy'
    end
  end
end
