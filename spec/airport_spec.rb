require 'airport'

#I'd like to learn more about before-do-end. I feel like I'm repeating stubs way too often!

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  describe 'initialization' do
    it 'should create a defined airport capacity' do
      full_airport = []
      subject.capacity.times {full_airport << plane}
      allow(airport).to receive(:planes) {full_airport}
      allow(airport).to receive(:stormy) {false}
      allow(plane).to receive(:landed) {false}
      expect{airport.land(plane)}.to raise_error 'Sorry, the airport is full'
    end

    it 'allows user to override default airport capacity' do
      airport = Airport.new(90)
      expect(airport.capacity).to eq(90)
    end

  end

  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should prevent landing when weather is stormy' do
      allow(plane).to receive(:landed) {false}
      allow(airport).to receive(:stormy) {true}
      expect{subject.land(plane)}.to raise_error 'Sorry, no landing in stormy weather'
    end
  end

  describe '#planes' do
    it 'should land a plane into an array' do
      allow(airport).to receive(:stormy) {false}
      allow(plane).to receive(:landed) {false}
      allow(plane).to receive(:land) {false}
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'should have a plane take off' do
      allow(airport).to receive(:stormy) {false}
      # subject.land(plane)
      allow(airport).to receive (:planes) {[plane]}
      allow(plane).to receive(:fly) {false}
      expect(subject.take_off).to eq plane
    end

    it 'confirms that plane has taken off' do   #issues with stubbing
      allow(airport).to receive(:stormy) {false}
      # allow(plane).to receive(:landed) {false}
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to eq []
    end

    it 'prevents take-off when weather is stormy' do    #issues with stubbing
      allow(airport).to receive(:stormy) {true}
      allow(airport).to receive(:take_off)
      allow(airport).to receive(:land)
      subject.land(plane)
      # subject.report_stormy
      expect{subject.take_off}.to raise_error 'Sorry, no taking off in stormy weather'
    end

  end
end
