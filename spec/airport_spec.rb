require 'airport.rb'
describe Airport do
  it 'instructs a plane to land at airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

end
