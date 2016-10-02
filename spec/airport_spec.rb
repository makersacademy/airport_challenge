require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  before(:each) do
    @plane = Plane.new
  end

  it 'should allows method land' do
    expect(airport).to respond_to :land
    expect(airport.land(@plane)).to eq(@plane)
  end

  it 'Should be able to land plane' do
    expect(airport.take_off).to eq(@plane)
  end

end
