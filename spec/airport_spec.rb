load 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }


  it 'confirms the plane is in the airport' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  # it 'confirms the plane has left the airport' do
  #   airport.land(plane)
  #   airport.take_off(plane)
  #   expect(airport.planes).not_to include plane
  # end

  context 'with weather as an argument,' do
    let(:weather) { described_class.new }

    it 'will not let a plane take off' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane)}.to raise_error 'Cannot take off due to shitty weather'
    end
  end



end