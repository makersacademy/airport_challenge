require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double(:plane) }

  before do
    allow(plane).to receive(:landed?)
    allow(plane).to receive(:landed).and_return(false)
  end

  it { is_expected.to respond_to(:instruct_land).with(1).argument }

  describe '#landing' do
    it "instructs plane to land" do
      airport.instruct_land(plane)
      expect(airport.planes.last).to eq plane
    end

    it 'confirm plane has landed' do
      expect(plane).to receive(:landed?)
      airport.instruct_land(plane)
    end
  end

  it { is_expected.to respond_to(:instruct_takeoff) }

  describe '#takeoff' do
    it "instructs plane to take off" do
      plane = Plane.new
      airport.planes << plane
      airport.instruct_takeoff
      expect(plane.landed).to eq false
    end

    it "confirm plane has taken off" do
      plane = Plane.new
      airport.planes << plane
      airport.instruct_takeoff
      expect(airport.planes.include?(plane)).to eq false
    end
  end


end
