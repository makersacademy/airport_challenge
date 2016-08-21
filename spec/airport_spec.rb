require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it {expect(airport).to respond_to(:land).with(1).argument}

  it 'confirms the plane is at that airport once landed' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

end
