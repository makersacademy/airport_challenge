require 'airport'

describe Airport do
  let(:plane1) {double :airplane}
  # let(:plane2) {double :airplane}
  subject(:airport) { described_class.new(Weather) }
  let(:airport2) {described_class.new(Weather)}

  before(:each) do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(plane1).to receive(:landed).and_return(false)
    allow(plane1).to receive(:take_off!).and_return(false)
    allow(plane1).to receive(:land_plane!).and_return(true)
  end

  describe 'hangar array' do
    it 'should have an empty hangar array on initialization' do
      expect(subject.hangar).to eq []
    end
  end

  describe 'receive' do
    it 'should push that plane into the hangar array' do
      subject.receive(plane1)
      expect(subject.hangar).to eq [plane1]
    end
  end

  describe 'send_away' do
    it 'should remove that plane from the hangar array' do
      airport.receive(plane1)
      airport.send_away(plane1)
      expect(airport.hangar).to eq []
    end

    it 'should not allow take off from an airport it is not at' do
      airport.hangar << plane1
      message = 'Plane not at that airport'
      expect{ airport2.send_away(plane1)}
    end
  end

  describe 'capacity' do
    it 'should have a default capacity when initialized.' do
      expect(subject.capacity).to eq Airport::DEFAULT_VALUE
    end


    it 'should raise an error when the airport is full' do
      10.times {airport.receive(Airplane.new)}
      message = 'Airport is full'
      expect{ airport.receive(plane1) }.to raise_error message
    end

    it 'should set a capacity if initialized with an argument' do
      airport = Airport.new(5, Weather)
      expect(airport.capacity).to eq 5
    end
  end

  describe 'weather' do
    it 'should not allow landing when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Too stormy to land'
      expect{ airport.receive(plane1) }.to raise_error message
    end

    it 'should not take off when weather is stormy' do
      airport.receive(plane1)
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Too stormy to take off'
      expect{ airport.send_away(plane1) }.to raise_error message
    end
  end

end
