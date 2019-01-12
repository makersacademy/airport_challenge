require './lib/airport.rb'

describe Airport do

it {is_expected.to respond_to :land}

  it "lands a plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

it {is_expected.to respond_to :take_off}

  it "Plane takes off" do
  expect(subject.take_off).to be_a Plane
end

end
