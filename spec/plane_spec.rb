require 'plane'

describe Plane do

  it 'cannot #land if already landed' do
    allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'Plane already landed'
  end

  it 'status can be changed to landed' do
    expect(subject.landed).to eq 'landed'
  end

  it '#landed method works' do
    expect(subject).to respond_to :landed
  end

  it '#landed? returns false if plane is flying' do
    expect(subject.landed?).to eq false
  end

  it '#landed? returns true if plane is landed' do
    plane = Plane.new
    plane.landed
    expect(plane.landed?).to eq true
  end

end
