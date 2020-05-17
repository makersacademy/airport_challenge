require './lib/airport'

describe Airport do

  subject(:airport) { Airport.new }

  it 'responds to #land method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
