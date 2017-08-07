require './docs/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
end

describe Airport do
  it { is_expected.to respond_to :create_planes }
  it 'creates a working plane' do
    plane = subject.create_planes
  expect(plane[0]).to be_working
  end
end

describe Airport do
  let (:airport) { Airport.new }
  let (:plane1) { Plane.new }
  context "Plane landing"
  it "When plane is created it is part of the planes array" do
    h = airport.landing(plane1)
  expect(h).to be_instance_of(Array)
  end
  it 'Plane should be added to @planes when it has landed' do
    airport.landing(:plane1)
    expect(airport.planes).to include(:plane1)
  end
end

describe Airport do
  let (:airport) { Airport.new }
  let (:plane1) { Plane.new }
  context "Plane taking off"
  it "When plane takes off it is no longer part of the @planes array" do
    expect(airport.planes).to be_empty
  end
end
