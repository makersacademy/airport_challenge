require 'airport.rb'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it 'responds to fly_plane' do
    expect(subject).to respond_to :fly_plane
  end

  it 'returns a plane when we call fly_plane' do
    @airport.land_plane(@plane)
    expect(@airport.fly_plane).to be_a(Plane)
  end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it 'adds a plane to the hangar when we call land_plane' do
    @airport.land_plane(@plane)
    expect(@airport.hangar).to eq [@plane]
  end

  it 'raises an error if there are no planes in the hangar' do
    expect { @airport.fly_plane }.to raise_error("No Planes!")
  end

  it 'raises an error if the hangar is full' do
    @airport.land_plane(@plane)
    expect { @airport.capacity.times { @airport.land_plane(@plane) } }.to raise_error("Too Full!")
  end

end
