require 'airport'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:weatherquality) }
  it { is_expected.to respond_to(:terminal) }
  it { is_expected.to respond_to(:capacity) }


  describe '#land' do
    it 'should not let a plane land if weather is bad' do
      plane = Plane.new
      expect {(subject.land(plane)).weatherquality}.to raise_error ('Weather is bad for landing') if subject.weatherquality == 'bad'
    end

    it 'should let a plane land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error if capacity is reached' do
      subject.capacity.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error('Capacity is full')
    end

    it 'can dock the maximum capacity of bikes' do
      subject.capacity.times {subject.land(Plane.new)}
      expect(subject.terminal.length).to eq subject.capacity
    end
  end

  describe '#takeoff' do
    it 'should let a plane take off' do
      plane = subject.land(Plane.new)
      expect(subject.takeoff(plane)).to include("#{plane}")
    end

    it 'should not let a plane take off if weather is bad' do
      plane = Plane.new
      expect {(subject.takeoff(plane)).weatherquality}.to raise_error ('Weather is bad for taking off') if subject.weatherquality == 'bad'
    end
  end

  it 'should tell us the weather' do
    subject.weatherquality
    expect(['bad','good']).to include(subject.weatherquality)
  end

end
