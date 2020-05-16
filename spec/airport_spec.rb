require 'airport'

describe Airport do
  it 'responds to #plane_in_airport?' do
    expect(subject).to respond_to(:plane_in_airport?)
  end
end
