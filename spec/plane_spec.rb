require 'plane'

describe Plane do

  it 'should land at an airport' do
    expect(subject).to respond_to(:land)
  end
end
