require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double(:plane) }
  let(:weather?) { double(:weather?,)}
  # let(:parked_plane) { double(:parked_plane, status: 'land') }
  it 'has a default capacity' do
    expect(airport.capacity).to eq 200
  end

  it 'cannot land planes when capacity is reached' do
    allow(airport).to receive(:weather).and_return 'sunny'
    allow(plane).to receive(:status)
    200.times { airport.land(plane) }
    expect { airport.land(plane)}.to raise_error
    'Airport full. Please stand by, over...'
  end

   it 'cannot land a plane if already landed' do
    # ßallow(plane).to receive(land)
    allow(airport).to receive(:weather).and_return 'sunny'
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error
    'You cannot land a plane that\'s already landed'
  end

  # it 'cannot land a plane if the weather is stormy' do
  #   allow(airport).to receive(:weather).and_return 'stormy'
  #   expect { airport.land(plane) }.to raise_error
  #   'Adverse weather. Please stand by, over...'
  # end
end
