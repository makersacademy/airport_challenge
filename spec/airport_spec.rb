require 'airport'

describe Airport do
  context 'initial settings' do
    it {should respond_to(:land).with(1).argument}
    it {should respond_to(:take_off)}
    it {should respond_to(:capacity)}
    it {should respond_to(:planes)}
    it {should respond_to(:closed?)}
    it {should respond_to(:closed=).with(1).argument}
    it {should respond_to(:include?).with(1).argument}
    it {should_not be_closed}
    describe "#capacity" do
      it 'has default specified in class' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
    end
  end

  context 'capacity' do
    it 'can have a user-defined capacity' do
      CUSTOM_CAPACITY = 100
      airport = Airport.new(CUSTOM_CAPACITY)
      expect(airport.capacity).to eq(CUSTOM_CAPACITY)
    end
  end

  describe '#land' do
    let (:plane){double(:plane)}
    before(:each) do
      allow(plane).to receive(:flying=).with(false)
      allow(plane).to receive(:flying?).and_return(false)
    end
    it 'plane that has landed is in airport' do
      subject.land(plane)
      expect(subject).to include(plane)
    end

    it 'last plane landed is not flying' do
      subject.land(plane)
      expect(subject.planes.last).to_not be_flying
    end

    it 'returns an error if airport is closed' do
      subject.closed = true
      expect {subject.land(plane)}.to raise_error("Airport is closed")
    end

    it 'returns an error if airport is full' do
      Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
      expect {subject.land(plane)}.to raise_error("Airport is full")
    end
  end

  describe '#take_off' do
    let (:plane){double(:plane)}
    before(:each) do
      allow(plane).to receive(:flying=).with(false)
      subject.land(plane)
      plane = subject.planes.last
      allow(plane).to receive(:flying=).with(true)
    end
    it 'plane that has taken off is flying' do
      plane = subject.take_off
      allow(plane).to receive(:flying?).and_return(true)
      expect(plane).to be_flying
    end
    it 'plane that has taken off is no longer in airport' do
      plane = subject.take_off
      allow(plane).to receive(:flying?).and_return(true)
      expect(subject).to_not include(plane)
    end
    it 'returns an error if airport is closed' do
      subject.closed = true
      expect {subject.take_off}.to raise_error("Airport is closed")
    end
  end

  describe '#closed' do
    it 'is closed' do
      subject.closed = true
      expect(subject).to be_closed
    end
    it 'is open' do
      subject.closed = false
      expect(subject).to_not be_closed
    end
  end
end
