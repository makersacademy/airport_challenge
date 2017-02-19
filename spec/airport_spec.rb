require 'airport'

describe Airport do
  it "responds to plane_landing method" do
    expect(subject).to respond_to :plane_landing
  end

  it { is_expected.to respond_to(:plane_landing).with(1).argument}

  it "allows planes to take_off" do
    expect(subject).to respond_to :plane_takeoff
  end

  it "can confirm whether an airplane has landed" do
    plane1 = Plane.new
    expect(subject.plane_landing(plane1)).to eq subject.avail_planes
  end

  it "allows planes that have landed to take_off" do
    plane1 = Plane.new
    subject.plane_landing(plane1)
    expect(subject.plane_takeoff).to eq plane1
  end

  it "throws an error if airport is full" do
    18.times {subject.plane_landing(Plane.new)}
    expect{ subject.plane_landing(Plane.new)}.to raise_error "airport full, please redirect"
  end

  it "Allows the change of default capacity", :test do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end
  it "Checks for default capacity" do
      airport = Airport.new
      expect(airport.capacity).to eq 18
   end

  it "doesn't allow planes to takeoff when weather is stormy" do
    airport = Airport.new
    subject.plane_landing(Plane.new)
    expec

  # it "doesn't allow planes to land when stormy"
end
