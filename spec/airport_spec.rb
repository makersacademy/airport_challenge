require 'airport'
require 'plane'

describe Airport do
  let(:plane) {Plane.new}

  it 'gets a plane to land at the airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
