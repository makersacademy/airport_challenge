  require "airport"
  
  describe Airport do
  let (:plane) {double :airplane, :landed= => false, landed?: false}

  it { is_expected.to respond_to :land_plane }

  it "land a plane" do
    airplane = Airplane.new
    allow(airplane).to receive(:landed).and_return(false)
    expect(subject.land_plane(airplane)).to include(airplane)
  end

  it { is_expected.to respond_to :takeoff_plane }

  it "takes off plane and confirms its absense" do
    subject.takeoff_plane(airplane)
    expect(airplane).to_not be_landed
  end
end