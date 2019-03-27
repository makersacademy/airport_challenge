require 'airport'

describe Airport do 
  let(:airport) { described_class.new(weather) }    
  let(:plane) { double(:plane) }
  let(:weather) { double :weather }

describe '#land' do
  context 'in good weather' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'receives a plane with #land' do
      airport.land(plane)
      expect(airport.hangar).to eql([plane])
    end

  end

  context 'in bad weather' do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

     it 'raises an error' do
       expect { airport.land(plane) }.to raise_error 'The weather is too stormy, you cannot land'
     end
  end
end

describe '#take_off' do
  context 'in good weather' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'removes a plane with #take off' do
      airport.land(plane)
      airport.take_off
      expect(airport.hangar.length).to eq 0
    end

  end

  context 'in bad weather' do
    before do 
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'raises an error' do
      expect { airport.take_off }.to raise_error("The weather is too stormy, you cannot take off")
    end
  end

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
