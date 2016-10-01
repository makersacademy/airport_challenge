require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  # let(:plane) {double :plane}
  # let(:planes) {double :planes}
  plane = Plane.new

  describe '#instruct_to_land' do
    it "tells a plane to land at the airport" do
      # allow(plane).to receive(:land)
      # allow(planes).to receive(:land)
      expect( subject.instruct_to_land(plane) ).to eq plane
    end
  end

  describe '#clearance' do
    let(:weather) {double :weather}
    it "checks whether planes should be allowed to take off or land" do
      allow(weather).to receive(:stormy).and_return :true
      expect(@clearance).to eq false 
    end
  end

  describe '#confirm_status' do
    it 'returns the status of a landed plane' do
      subject.instruct_to_land(plane)
      planes = []
      planes << plane
      plane.land
      expect(subject.confirm_status(plane)).to eq :landed
    end
  end

  describe '#instruct_to_take off' do
    it 'tells landed planes to take off' do
    subject.instruct_to_land(plane)
    planes = []
    planes << plane
    plane.land
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
