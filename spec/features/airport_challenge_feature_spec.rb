describe 'Airport' do 

  let(:weather) {Weather.new}
  let(:airport) {Airport.new(weather)}
  let(:plane) {Plane.new}

  it 'receives a plane with #land' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.hangar).to eql([plane])
  end

end