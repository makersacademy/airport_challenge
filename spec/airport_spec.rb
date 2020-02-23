require 'airport'


describe Airport do

  it '#lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'raises an error when full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
  end


  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'took off a plane' do
    expect(subject.takeoff).to eq 'Airplane has took off'
  end

  it 'there is a storm' do
    allow(subject).to receive(:storm?) {true}
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(20)
      20.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport is full'
    end
    end
  end
