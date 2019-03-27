describe 'Airport' do 

  let(:weather) {Weather.new}
  let(:airport) {Airport.new(weather)}
  let(:plane) {Plane.new}

  it 'receives a plane with #land' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.hangar).to eql([plane])
  end

  it 'only allows #take_off in sunny weather' do
    allow(weather).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error("The weather is too stormy, you cannot take off")
  end

  it 'only allows #land in sunny weather' do
    allow(weather).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'The weather is too stormy, you cannot land'
  end

  it 'only allows 5 planes to land' do
    allow(weather).to receive(:stormy?).and_return false
    5.times do
      airport.land(plane)
    end
    expect{ airport.land(plane) }.to raise_error("This airport is full, you cannot land here")
  end

  it '#change_capacity changes the airport capacity' do
    allow(weather).to receive(:stormy?).and_return false
    5.times do
      airport.land(plane)
    end
    airport.change_capacity_to(10)
    airport.land(plane)
    expect(airport.hangar.length).to eql(6)
  end

end