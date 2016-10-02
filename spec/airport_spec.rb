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
    it "tells a plane to land at the airport" do
      allow(plane).to receive(:land)
      expect( subject.instruct_to_land(plane) ).to eq plane
    end
    it 'will not allow a plan to land during stormy weather' do
      subject.clearance(weather)
      expect{ subject.instruct_to_land(plane) }.to raise_error "Clearance for landing not granted: stormy weather"
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
      planes = []
      planes << plane
      plane.land
    end
    it 'tells landed planes to take off' do
    expect( subject.instruct_to_takeoff(plane) ).to eq plane
    end
  end
end

  # describe '#clearance_for_landing' do
  #   it 'gives permission for planes to land' do
  #     allow(plane).to receive(:land)
  #     allow(plane).to receive(:status).and_return(:landed)
  #     clearance_for_landing = true
  #     plane.land
  #     expect(plane.status).to eq :landed
  #   end
  # end
