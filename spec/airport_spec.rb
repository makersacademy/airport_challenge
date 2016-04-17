load 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'confirms the plane is in the airport' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  context 'with weather as an argument,' do
    let(:weather) { double :weather, stormy?: nil }

    it 'will not let a plane take off in shitty weather' do
    airport.land(plane)
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane)}.to raise_error('Cannot take off due to shitty weather')
    end

    let(:weather) { double :weather, stormy?: nil }

    it 'will let a plane take off in fine weather' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane)}
    end
  end

end