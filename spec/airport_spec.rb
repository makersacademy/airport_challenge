require 'plane'
require 'airport'
require 'weather'

describe Airport do
  it 'expect every new airport to have the capacity for planes' do
    expect(subject.planes).to eq []
  end

  it 'expect a plane that has landed to exist at the airport' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes).to include plane
  end

  it 'expect a plane that has not landed to not exist at the airport' do
    plane = Plane.new
    expect(subject.planes).not_to include plane
  end
end
