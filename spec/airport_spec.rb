require 'airport'

describe Airport do
    subject(:airport) { described_class.new(10) }
    
  it 'lets a plane land' do 
    #subject = Airport
    expect(airport).to respond_to(:land).with(1).argument
  end


  it 'prevents landing when airport is at full capacity' do
    plane = double :plane
    10.times do 
        #using doubles 
        airport.land(plane)
    end 
    expect { airport.land(plane) }.to raise_error 'Caution: Airport full, plane cannot land. MAX capacity: 10'
  end

  it 'lets plane take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end 

  it 'raises an error when plane tries to land when stormy' do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'Caution: Airport cannot land plane, weather is stormy'
  end

  it 'raises an error when plane tries to take off when stormy' do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error 'Caution: Airport cannot take off plane, weather is stormy'
  end

end