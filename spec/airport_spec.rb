require './docs/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }

describe Airport do
  it { is_expected.to respond_to :create_planes}
  it 'creates a working plane' do
  plane = subject.create_planes
  expect(plane[0]).to be_working
  end
end

describe Airport do

 subject(:airport) { described_class.new }
 let(:plane) {double :planes}

it "includes the plane in the planes array after landing" do
# Error on line below: "can't define singleton"
allow(:plane).to receive(:landing)
airport.landing(plane)
expect(airport.planes).to include plane
end
end
end


=begin
describe Airport do
# This is incorrect as it is testing behaviour not state
  it "the plane has left the airport instance once it has taken off" do
    airport = Airport.new
    plane1 = Plane.new
# Getting error still saying:
# expected: #<Airport:0x007ff9da3e1350 @planes=[]>
#          got: nil
# Suspect this may be my Rspec code
    h = airport.take_off(plane1)
    expect(h).to eq airport
  end
end
=end
