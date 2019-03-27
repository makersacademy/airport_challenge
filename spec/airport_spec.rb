require 'airport'

describe Airport do 
  let(:airport) { described_class.new(weather) }    
  let(:plane) { double(:plane) }
  let(:weather) { double :weather }


  it 'receives a plane with #land' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.hangar).to eql([plane])
  end
     
  it 'responds to #take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
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
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    expect{ airport.land(plane) }.to raise_error("This airport is full, you cannot land here")
  end

  it '#change_capacity changes the airport capacity' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.change_capacity_to(10)
    airport.land(plane)
    expect(airport.hangar.length).to eql(6)
  end

end
