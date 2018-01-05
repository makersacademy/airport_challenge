require 'airport.rb'

describe Airport do
  it 'a plane lands in the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
end
