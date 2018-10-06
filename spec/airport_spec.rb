require 'airport.rb'

describe Airport do
#   is there a plane?

  it 'I want to instruct a plane to land at an airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.total_planes(plane)).to eq true
  end
end



describe Plane do

end
