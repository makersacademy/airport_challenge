require 'airport.rb'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}

  it "a plane lands at airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end


end
