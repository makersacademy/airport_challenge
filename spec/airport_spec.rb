load 'airport.rb'

describe Airport do
  let(:weather) { double :weather, stormy?: nil }
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'confirms the plane is in the airport' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end


  context 'with weather as an argument,' do
    let(:weather) { double :weather, stormy?: true }

    it 'will not let a plane take off if stormy' do
    airport.land(plane)
    expect{airport.take_off(plane)}.to raise_error'Cannot take off due to stormy weather'
    end

    let(:weather) { double :weather, stormy?: nil }

    it 'will let a plane take off if fine' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane)}
    end

    it 'will not let a plane land if stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error 'Cannot land a plane in stormy weather'
    end


  end

end