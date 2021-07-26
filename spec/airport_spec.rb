require "airport"

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  it 'instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument 
  end 

  it 'instructs plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  context 'when airport is full' do
    10.times do
      airport.land(plane)
    end
    it 'raises error message to indicate airport is full' do 
      expect { airport.land(plane) }.to raise_error 'Cannot land plane due to full capacity'
    end
    
  end 

  context 'when weather is stormy' do
    it 'raises error message to indicate stormy weather' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane due to stormy weather'
    end 
    it 'raises error message to indicate stormy weather' do
      expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off due to stormy weather'
    end 
  end

end 
