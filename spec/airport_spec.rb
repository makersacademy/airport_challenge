require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument}

    it 'lands a plane at the airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq airport
    end

    it 'lets a plane leave the airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq nil
  end


  it 'doesn\'t accept more planes than capacity'
  plane = Plane.new
  Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
  expect {subject.land(plane)}.to raise_error("Airport full")
end
