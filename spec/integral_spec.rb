require 'airport'
require 'plane'

describe Plane do
  before { @airport = Airport.new }
  before { allow(@airport).to receive(:stormy?).and_return false }

  it 'is expected to depart only from the airport it is in' do
    airport2 = Airport.new
    subject.land_at(@airport)
    expect { subject.takeoff_from(airport2) }.to raise_error
  end

  it 'is expected not to be able to land if already landed' do
    subject.land_at(@airport)
    expect { subject.land_at(@airport) }.to raise_error
  end

  it 'is expected not to be able to take off if already flying' do
    subject.land_at(@airport)
    subject.takeoff_from(@airport)
    expect { subject.takeoff_from(@airport) }.to raise_error
  end
end
