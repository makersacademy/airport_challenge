require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  before(:each) do
    @plane = Plane.new
  end

  it 'should allows method land' do
    expect(airport).to respond_to :land
    expect(airport.land(@plane)).to eq([@plane])
  end

  it 'Should be able to take off' do
    airport.land(@plane)
    expect(airport.take_off).to eq(@plane)
  end

  it 'Should not allow planes to land if weather is stormy' do
    #allow(@weather).to receive(:stormy?){:true}
    expect{airport.land(@plane)}.to raise_error("Can't land plane :( ")
  end

  # it 'test stormy is set to true' do
  #     @weather = Weather.new
  #     (@weather.stormy?).to eq(true)
  #     expect(@weather.stormy?).to eq(true)
  # end

it 'Should not allow planes to land if capacity is at max' do
  5.times{airport.land(Plane.new)}
  expect{airport.land(Plane.new).to raise_error("Airport is full")}
end
end
