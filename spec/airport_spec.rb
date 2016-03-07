require 'airport'

describe Airport do
  let(:plane1) {double :airplane, :land_plane => true}
  subject(:airport) { described_class.new }
  let(:airport2) {described_class.new}

  before(:each) do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(plane1).to receive(:landed).and_return(false)
    allow(plane1).to receive(:take_off).and_return(false)
  end

  describe 'planes array' do
    it 'should have an empty planes array on initialization' do
      expect(subject.planes).to eq []
    end
  end

  describe 'allow_landing' do
    it 'should push that plane into the planes array' do
      subject.allow_landing(plane1)
      expect(subject.planes).to eq [plane1]
    end

    it 'should confirm the plane has landed with the plane status' do
      allow(plane1).to receive(:landed).and_return(true)
      expect(plane1.landed).to eq true
    end

    it 'should not allow landing if already landed' do
      allow(plane1).to receive(:landed).and_return(true)
      message = 'Plane already landed'
      expect{ airport.allow_landing(plane1) }.to raise_error message
    end
  end

  describe 'allow_takeoff' do
    it 'should remove that plane from the planes array' do
      airport.allow_landing(plane1)
      allow(plane1).to receive(:landed).and_return(true)
      airport.allow_takeoff(plane1)
      expect(airport.planes).to eq []
    end

    it 'should confirm that the plane has taken off with the plane status' do
      allow(airport).to receive(:allow_landing).and_return(true)
      airport.allow_landing(plane1)
      allow(airport).to receive(:allow_takeoff).and_return(true)
      airport.allow_takeoff(plane1)
      allow(plane1).to receive(:plane_status).and_return(false)
      expect(plane1.plane_status).to eq false
    end

    it 'should not allow take off from an airport it is not at' do
      airport.planes << plane1
      message = 'Plane not at that airport'
      expect{ airport2.allow_takeoff(plane1)}
    end

    it 'should not take off from airport if already taken off' do
      message = 'Plane already taken off'
      expect { airport.allow_takeoff(plane1) }.to raise_error message
    end
  end

  describe 'capacity' do
    it 'should have a default capacity when initialized.' do
      expect(subject.capacity).to eq Airport::DEFAULT_VALUE
    end


    it 'should raise an error when the airport is full' do
      10.times {airport.allow_landing(Airplane.new)}
      message = 'Airport is full'
      expect{ airport.allow_landing(plane1) }.to raise_error message
    end

    it 'should set a capacity if initialized with an argument' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end

  describe 'weather' do
    it 'should not allow landing when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      message = 'Too stormy to land'
      expect{ airport.allow_landing(plane1) }.to raise_error message
    end

    it 'should not take off when weather is stormy' do
      airport.allow_landing(plane1)
      allow(airport).to receive(:stormy?).and_return(true)
      allow(plane1).to receive(:landed).and_return(true)
      message = 'Too stormy to take off'
      expect{ airport.allow_takeoff(plane1) }.to raise_error message
    end
  end

end
