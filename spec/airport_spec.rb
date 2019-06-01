require 'airport'

describe Airport do

  it 'weather is either sunny or stormy' do
    airport = Airport.new
    expect(airport.weather).to eq('sunny').or eq('stormy')
  end

  it 'checks to see if airport is full' do
    airport = Airport.new
    expect(airport).to be_full  
  end

  it 'is initialised with a capacity argument that can override default' do
    airport = Airport.new(100)
    expect(airport.instance_variable_get(:@capacity)).to eq(100)
  end

  it 'is initialised with a instance variable to hold planes' do
    airport = Airport.new
    expect(airport.instance_variable_get(:@hanger)).to be_an_instance_of(Array)
  end

  context "hanger should be at capacity" do
    airport = Airport.new
    before { allow(airport).to receive(:hanger.length).and_return(10) }

    it 'should be full if the hanger is at capacity' do
      expect(airport).to be_full
    end
  end

  context "weather is sunny" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('sunny') }
    
    it 'should be safe to land / takeoff if weather is sunny' do
      airport.set_safety
      expect(airport).to be_safe
    end
  end

  context "weather is stormy" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('stormy') }
    
    it 'should not be safe to land / takeoff if weather is stormy' do
      airport.set_safety
      expect(airport).not_to be_safe
    end
  end
end