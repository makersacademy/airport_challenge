require 'airport'

describe 'Plane' do
  let(:plane) {Plane.new}

  it 'can creates a plane' do
    expect(plane).to be_instance_of(Plane)
  end
end

describe 'Airport' do
  let(:airport) {Airport.new}

  it 'can create an airport' do
    expect(Airport.new).to be_instance_of(Airport)
  end

  it 'can respond to #lands' do
    expect(airport).to respond_to(:land)
  end

  it 'can land and conmfirms the plane has landed' do
    expect(airport.land).to eq "Safely landed"
  end

  it 'can respond to #take_off' do
    expect(airport).to respond_to(:take_off)
  end

  it 'confirms plane not at aiport using #take_off' do
    expect(airport.take_off).to eq "Plane is no longer at the airport"
  end

  describe 'Plane' do
    let(:plane) {Plane.new}

    it 'can creates a plane' do
      expect(plane).to be_instance_of(Plane)
    end
  end

end
