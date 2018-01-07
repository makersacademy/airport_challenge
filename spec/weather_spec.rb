describe Weather do

  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

  it 'is stormy' do
    @stormy = false
    expect(weather).to be_stormy
  end

end
