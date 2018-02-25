require 'airport'
describe Airport do
  subject(:airport) { Airport.new }

  # create a plane before each test
  before(:each) do
    @plane = Plane.new(1)
  end

  # airport land method check
  it '#land' do
    expect(airport).to respond_to(:land).with(1).arguments
    expect(airport.land(@plane).last).to eq(@plane)
  end

  # airport take off method check
  it '#take_off' do
    expect(airport).to respond_to(:take_off).with(1).arguments
    airport.land(@plane) # landing a test plane before take_off
    expect(airport.take_off(@plane)).to eq(@plane)
  end

  # airport prevent landing method check
  it '#prevent_landing' do
    expect(airport).to respond_to(:prevent_landing)
  end

  it '#prevent_take_off' do
    # airport prevent take off method check
    expect(airport).to respond_to(:prevent_take_off)
  end
end
