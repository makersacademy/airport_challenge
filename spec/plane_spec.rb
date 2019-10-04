require 'plane'
describe Plane do
 describe "#flying?" do
  it 'returns false for flying as plane is on ground' do
    subject {Plane.new}
    airport = Airport.new
    airport.land(subject)
    expect(subject.flying?).to eq false
  end
 end
end
