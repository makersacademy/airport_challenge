require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:Airport){described_class}
  context 'initial settings' do
    it {should respond_to(:land).with(1).argument}
    it {should respond_to(:take_off)}
    it {should respond_to(:capacity)}
    it {should respond_to(:closed?)}
    it {should respond_to(:closed=).with(1).argument}
    it {should respond_to(:include?).with(1).argument}
    it {should_not be_closed}
    it 'has default capacity specified in class' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'capacity' do
    it 'can have a user-defined capacity' do
      CUSTOM_CAPACITY = 100
      airport = Airport.new(CUSTOM_CAPACITY)
      expect(airport.capacity).to eq(CUSTOM_CAPACITY)
    end
  end

  context 'empty airport' do
    it 'raises an error if there are no planes in airport' do
      expect {airport.take_off}.to raise_error("No planes in airport")
    end

  end

  describe '.land' do
    let (:plane){double(:plane)}
    before(:each) do
      allow(plane).to receive(:land)
      allow(plane).to receive(:flying?).and_return(true || false)
    end
    it 'plane that has landed is in airport' do
      airport.land(plane)
      expect(airport).to include(plane)
    end

    it 'last plane landed is not flying' do
      airport.land(plane)
      allow(plane).to receive(:flying?).and_return(false)
      expect(airport.last_plane).to_not be_flying
    end

    it 'raises an error if plane is not flying' do
      allow(plane).to receive(:flying?).and_return(false)
      expect {airport.land(plane)}.to raise_error("Plane is not flying")
    end

    it 'raises an error if airport is closed' do
      airport.closed = true
      expect {airport.land(plane)}.to raise_error("Airport is closed")
    end

    it 'raises an error if airport is full' do
      Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
      expect {airport.land(plane)}.to raise_error("Airport is full")
    end
  end


  describe '.take_off' do
    let (:plane){double(:plane)}
    before(:each) do
      allow(plane).to receive(:land)
      allow(plane).to receive(:flying?).and_return(true)
      airport.land(plane)
      allow(plane).to receive(:flying?).and_return(false)
      plane = airport.last_plane
    end

    it 'plane that has taken off is flying' do
      allow(plane).to receive(:take_off)
      plane = airport.take_off
      allow(plane).to receive(:flying?).and_return(true)
      expect(plane).to be_flying
    end

    it 'plane that has taken off is no longer in airport' do
      allow(plane).to receive(:take_off)
      plane = airport.take_off
      allow(plane).to receive(:flying?).and_return(true)
      expect(airport).to_not include(plane)
    end


    it 'raises an error if airport is closed' do
      airport.closed = true
      expect {airport.take_off}.to raise_error("Airport is closed")
    end

    it 'raises an error if plane is not on the ground' do
      allow(plane).to receive(:flying?).and_return(true)
      expect {airport.take_off}.to raise_error("Plane is not on the ground")
    end
  end

  describe '.closed' do
    it 'is closed' do
      airport.closed = true
      expect(airport).to be_closed
    end

    it 'is open' do
      airport.closed = false
      expect(airport).to_not be_closed
    end
  end
end
