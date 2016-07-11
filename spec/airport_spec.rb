require "airport"
#require "plane"

describe Airport do

# let (:plane) {double :plane}
describe "#land" do

  it "instructs a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "instructs a plane to take_off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "doesn't allow planes to land when stormy" do
    weather = Weather.new

  end

  # it "lands a plane" do
  #
  #   #plane = Plane.new
  # subject.land(plane)
  # expect(subject.plane).to eq plane
  # end
end

  #it { is_expected.to respond_to :take_off }













end
