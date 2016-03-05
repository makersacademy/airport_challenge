require 'airport'
require 'plane'

describe Airport do

  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:instruct_land).with(1).argument }

  describe '#landing' do
    it "instructs plane to land" do
      expect(subject.instruct_land(plane)).to eq plane
    end

    it "confirm plane has landed" do
      plane = Plane.new
      subject.instruct_land(plane)
      expect(plane.status).to eq false
    end
  end


  # it { is_expected.to respond_to(:instruct_takeoff) }
  #
  # describe '#instruct_takeoff' do
  #   it "plane takes off" do
  #
  #   end
  # end

end
