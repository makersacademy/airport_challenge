require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it 'returns plane when plane lands in airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'returns message to say plane has taken off after take_off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq "Plane has taken off"
  end

  it { is_expected.to respond_to(:planes) }

  # it 'can hold planes' do
  #   expect(subject)
  # end

  # it 'raises an error when plane tries to land in full airport' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   airport.land(plane)
  #   expect(airport.land(plane)).to raise_error 'Airport full; plane cannot land'
  # end
end
