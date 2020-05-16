require 'airport'

describe Airport do
  let(:plane) { Airport.new } 

  describe "#airport" do
    it { is_expected.to respond_to :plane }

    it "should have a plane take off and confirm it has gone" do
    expect(plane.takeoff).to eq true
    end

    # it "raise an error if airport is full" do
    # # airport.capacity.times { airport.land(plane) }
    # expect { airport.land }.to raise_error "Airport at capacity"
    # end
  end
  describe "#stormy" do
  it { is_expected.to respond_to :stormy? }

  it "should prevent landing when stormy" do 
    expect { plane.land }.to raise_error "Too stormy to land"
 end

 it "should prevent take-off when stormy" do 
    expect { subject.takeoff }.to raise_error "Too stormy to take-off"
 end
  end
end