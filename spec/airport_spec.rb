require 'airport'

describe Airport do

  subject(:airport) { described_class.new(10) }

  it 'is full when equal to the capacity of planes' do
    allow(airport).to receive(:storm?) { false }
    10.times { Plane.new.land(airport) }
    expect(airport.full?).to be_truthy
  end


end
