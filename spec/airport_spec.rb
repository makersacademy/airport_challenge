require 'airport'

describe Airport do

  it 'weather is either sunny or stormy' do
    airport = Airport.new(10)
    expect(airport.weather).to eq('sunny').or eq('stormy')
  end

  it 'checks to see if airport is full' do
    airport = Airport.new(10)
    expect(airport).to be_full  
  end

  it 'is initialised with a capacity argument' do
    airport = Airport.new(10)
    expect(airport.instance_variable_get(:@capacity)).to eq(10)
  end

  context "weather is sunny" do
    airport = Airport.new(10)
    before { allow(airport).to receive(:weather).and_return('sunny') }
    
    it 'should be safe to land / takeoff if weather is sunny' do
      airport.set_safety
      expect(airport).to be_safe
    end
  end

  context "weather is stormy" do
    airport = Airport.new(10)
    before { allow(airport).to receive(:weather).and_return('stormy') }
    
    it 'should not be safe to land / takeoff if weather is stormy' do
      airport.set_safety
      expect(airport).not_to be_safe
    end
  end
end