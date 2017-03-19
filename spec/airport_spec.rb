require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}

  describe 'initialization' do
    it 'should create a defined airport capacity' do
      allow(airport).to receive(:stormy).and_return(false)
      subject.capacity.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Sorry, the airport is full'
    end

    it 'allows user to override default airport capacity' do
      allow(airport).to receive(:stormy).and_return(false)
      airport = Airport.new(90)
      90.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Sorry, the airport is full'
    end

  end

  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should prevent landing when weather is stormy' do
      subject.report_stormy
      expect{subject.land(plane)}.to raise_error 'Sorry, no landing in stormy weather'
    end
  end

  describe '#planes' do
    it 'should return the planes at the airport' do
      allow(airport).to receive(:stormy) {false}
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'should have a plane take off' do
      allow(airport).to receive(:stormy) {false}
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'confirms that plane has taken off' do
      allow(airport).to receive(:stormy) {false}
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to eq []
    end

    it 'prevents take-off when weather is stormy' do
      allow(airport).to receive(:stormy) {true}
      allow(airport).to receive(:take_off)
      allow(airport).to receive(:land)
      subject.land(plane)
      # subject.report_stormy
      expect{subject.take_off}.to raise_error 'Sorry, no taking off in stormy weather'
    end

  end
end
