require 'airport'
describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}
  it { is_expected.to respond_to(:land).with(1).argument}

  it { is_expected.to respond_to(:take_off).with(1).argument}

  it 'plane lands' do
    allow(airport).to receive(:weather) { 'sunny' }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'plane takes off' do
    allow(airport).to receive(:weather) { 'sunny' }
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.hanger).not_to include(plane)
  end

  it 'error trying to land when at capacity' do
    allow(airport).to receive(:weather) { 'sunny' }
    airport.capacity.times { airport.land :plane }
    expect { airport.land :plane }.to raise_error('hanger already full')
  end
  
  it 'checks if default capacity can be overwritten' do
    random_capacity = Random.rand(100)
    airport = Airport.new(random_capacity)
    expect(airport.capacity).to eq(random_capacity)
  end

  it 'checks the weather' do
    expect(airport).to respond_to(:weather)
  end

  it 'error when trying to land when the weather is stormy' do
    allow(airport).to receive(:weather) { 'stormy' }
    expect { airport.land :plane }.to raise_error('the weather is stormy, cannot land') 
  end

  it 'error when trying to land when the weather is stormy' do
    allow(airport).to receive(:weather) { 'stormy' }
    expect { airport.take_off :plane }.to raise_error('the weather is stormy, cannot take off') 
  end
end
