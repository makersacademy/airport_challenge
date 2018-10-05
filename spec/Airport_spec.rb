require './lib/Airport.rb'

describe Airport do
  it 'Should land a plane at the Airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Should make a plane at the Airport take off and check its no longer there' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hangar).to eq 'empty'
  end
end

describe 'initialisation' do
  heathrow = Airport.new
  it 'should have a plane in the hangar' do
    plane = Plane.new
    heathrow.land(plane)
    expect(heathrow.hangar).to eq [plane]
  end
end
