require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  it 'allows the creation of an airport' do
    array = []
    array << airport
    expect(array).to eq [airport]
  end

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:planes)}

  it 'allows a plane to land' do
    expect(airport.land(plane)).to eq plane
  end

  it 'allows confirmation that the plane has landed' do
    airport.land(plane)
    expect(airport.planes).to eq plane
  end

end
