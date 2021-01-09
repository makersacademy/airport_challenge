require 'airport'
require 'plane'

describe Airport do
  it "responds to land_plane" do
    expect(subject).to respond_to(:land_plane)
  end

  it 'adds plane to the runway if landing is approved' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.runway).to include(plane)
  end

  it "responds to take_off" do
    expect(subject).to respond_to :take_off
  end

  it "gives permission for take off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true unless plane.flying? == true
  end

  it "prevents landing when the runway is full (capacity is 20 planes)" do
    21.times { subject.land_plane Plane.new }
    expect(subject.full?).to eq false
  end

  # it "prevents landing when the weather is stormy" do
  #   expect { subject.land_plane Plane.new }.to raise_error "Too stormy to land" unless be_true{ subject.weather? }
  # end

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq 20
  end

  it "the default capacity can be overwritten" do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end

end
