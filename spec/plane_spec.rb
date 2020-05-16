require 'plane'

describe Plane do
  it 'responds to #at_airport?' do
    expect(subject).to respond_to(:at_airport?)
  end
end
