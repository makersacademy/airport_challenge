load 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to(:weather)}

  it 'confirms the plane is in the airport' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it 'confirms the plane has left the airport' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end


end



