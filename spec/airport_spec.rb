require 'airport'

describe Airport do

  let(:plane) {double :plane}
  let(:plane2) {double :plane2}

  describe '#land' do

    before(:each) do
      allow(plane).to receive(:ground)
      allow(plane).to receive(:in_flight)
    end

    it {is_expected.to respond_to(:land).with(1).argument}

    it 'lands plane' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      allow(subject).to receive(:bad_weather?).and_return true
      expect{subject.land(plane)}.to raise_error "Ach no, there's a storm a-brewin'!"
    end

    it 'prevents landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "Sorry, we've got more planes that you can shake a stick at."
    end

    it 'prevents landing if plane is grounded' do
      allow(plane).to receive(:in_flight).and_return false
      expect{subject.land(plane)}.to raise_error "Plane's aleady down, Sir"
    end

  end

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows planes to take off and leave airport' do
      plane = double(:plane, :ground => false, :fly => true)
      allow(plane).to receive(:in_flight)
      plane2 = double(:plane2, :ground => false)
      allow(plane2).to receive(:in_flight)
      allow(subject).to receive(:bad_weather?).and_return false
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).to eq [plane2]
    end

    it 'it prevents take off when weather is stormy' do
      plane = double(:plane, :ground => false, :fly => true)
      allow(plane).to receive(:in_flight)
      allow(subject).to receive(:bad_weather?).and_return false
      subject.land(plane)
      allow(subject).to receive(:bad_weather?).and_return true
      expect{subject.take_off(plane)}.to raise_error "Ach no, there's a storm a-brewin'!"
    end

    it 'prevents take off if plane is flying' do
      allow(plane).to receive(:in_flight).and_return true
      expect{subject.take_off(plane)}.to raise_error "Plane's already up there, Sir."
    end

    it 'only allows plane to take off from airport they are in' do
      plane = double(:plane, :ground => false, :in_flight => true)
      airport2 = Airport.new
      airport2.land(plane)
      plane = double(:plane, :fly => false, :in_flight => false)
      expect{subject.take_off(plane)}.to raise_error "Plane's in another airport, Sir."
    end

  end

  it 'sets airport capacity' do
    airport = Airport.new(2)
    expect(airport.capacity).to eq 2
  end

end
