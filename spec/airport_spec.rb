require 'airport.rb'

describe Airport do

  let(:airport) { Airport.new }

  it 'responds to #takeoff' do
    expect(airport).to respond_to :takeoff
  end

  it 'responds to #land' do
    expect(airport).to respond_to :land
  end

  it '#land returns an instance of plane' do
    expect(airport.land(Plane.new)).to be_an_instance_of(Plane)
  end

end
