require 'airport.rb'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}

  it "A plane lands at airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "A plane takes off from airport" do
    plane = Plane.new
    expect(subject.take_off).to eq nil
  end

end
