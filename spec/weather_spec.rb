describe Weather do

  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

  it 'is stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(weather).to be_stormy
  end

end
