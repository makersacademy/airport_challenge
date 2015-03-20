require 'plane'
describe 'plane location' do
  it 'has landed in airport' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end

  it 'has taken off' do
    plane = Plane.new
    expect(plane.taken_off).to eq false
  end
end
