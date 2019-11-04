require 'plane'

describe Plane do
  it 'responds to land_at_airport' do
    expect(subject).to respond_to :land_at_airport
  end
end
