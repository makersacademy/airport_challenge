require 'airport'

describe Airport do

  it 'responds to land method' do
    expect(subject).to respond_to :land
  end
end

describe '#land' do
  airport = Airport.new

  it 'lands a plane' do
    expect(airport.land).to be_instance_of Plane
  end
end
