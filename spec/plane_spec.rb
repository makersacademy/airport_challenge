require 'plane'

describe Plane do
  it 'when reading location of a plane' do
    expect(subject).to respond_to :location
  end
end