require 'airport'

describe 'Airport' do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it 'can create an airport' do
    expect(Airport.new).to be_instance_of(Airport)
  end

  it 'can respond to #lands' do
    expect(airport).to respond_to(:land)
  end

  it 'can land and conmfirms the plane has landed' do
    expect(airport.land(plane)).to eq "Safely landed"
  end

  it 'can respond to #take_off' do
    expect(airport).to respond_to(:take_off)
  end

  it 'confirms plane not at aiport using #take_off' do
    2.times { airport.land(plane) }
    expect(airport.take_off).to eq "flight number #{plane} is no longer at the airport"
  end

  it 'confirms plane is not at the airport after #take_off' do
    airport.land(plane)
    airport.take_off
    expect(airport.landing_strip).not_to include(plane)
  end

  it 'will throw an error if #land is called when whether is stormy' do
    airport.weather = "Stormy"
    expect { airport.land(plane) }.to raise_error("Sorry, too stormy")
  end

  it 'will throw an error if #take_off is called when whether is stormy' do
    airport.weather = "Stormy"
    expect { airport.take_off }.to raise_error("Sorry, too stormy")
  end

  describe 'Plane' do
    let(:plane) {Plane.new}

    it 'can create a plane' do
      expect(plane).to be_instance_of(Plane)
    end
  end

end
