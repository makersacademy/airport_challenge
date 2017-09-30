require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
  it 'is possible to create planes' do
    expect(Plane.new).to be_instance_of Plane
  end

  it 'can be told to land at an airport' do
    subject.land airport
    expect(subject.destination).to eq airport
  end

end
