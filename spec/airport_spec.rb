require 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument

  it "should raise error if weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:weather).and return(:stormy)
    expect { subject.let_plane_land(plane) } .to raise_error "Cannot land, weather is stormy"
  end

 

  end
end
