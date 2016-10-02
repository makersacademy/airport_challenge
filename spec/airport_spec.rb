require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  let(:weather) { double :weather, stormy?: true  }
  let(:plane) {double :plane}

  describe '#initialize' do
  it 'sets default capacity' do # need to stub this it uses default capacity
    allow(plane).to receive(:land)
    4.times{ subject.instruct_to_land(plane) }
    expect(subject.instruct_to_land(plane)).to eq plane
  end
  it "allows a specific capacity to be set" do
    allow(plane).to receive(:land)
    airport = Airport.new(10)
    10.times { airport.instruct_to_land(plane) }
    expect {airport.instruct_to_land(plane)}.to raise_error "Clearance for landing not granted: airport full"
  end
end

  describe '#instruct_to_land' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.instruct_to_land(plane)
      @landed_planes = []
      @landed_planes << plane
      plane.land
    end
    it "tells a plane to land at the airport" do
      expect( subject.instruct_to_land(plane) ).to eq plane
    end
    it 'will not allow a plane to land during stormy weather' do
      subject.clearance(weather)
      expect{ subject.instruct_to_land(plane) }.to raise_error "Clearance for landing not granted: stormy weather"
    end
    it 'will not allow a plane to land if the airport is at capacity' do
      airport = Airport.new(1)
      airport.instruct_to_land(plane)
      expect{ airport.instruct_to_land(plane) }.to raise_error "Clearance for landing not granted: airport full"
    end
    it 'stores the plane in the airport' do
      subject.instruct_to_land(plane)
      expect( @landed_planes.include?(plane) ).to eq true
    end
  end

  describe '#clearance' do
    it "checks whether planes should be allowed to take off or land" do
      expect( subject.clearance(weather) ) .to eq false
    end
  end

  describe '#confirm_status' do
    it 'returns the status of a landed plane' do
      allow(plane).to receive(:status).and_return (:landed)
      expect(subject.confirm_status(plane)).to eq :landed
    end
  end

  describe '#instruct_to_take off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.instruct_to_land(plane)
      plane.land
    end
    it 'removes the plane for the airport' do
      expect( subject.instruct_to_takeoff(plane) ).to eq plane
    end
    it 'tells landed planes to take off' do
    expect( subject.instruct_to_takeoff(plane) ).to eq plane
    end
    it 'will not allow a plane to take off during stormy weather' do
    subject.clearance(weather)
    expect{ subject.instruct_to_takeoff(plane) }.to raise_error "Clearance for takeoff not granted: stormy weather"
  end
end
end
