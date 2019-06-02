require 'airport'

describe Airport do

  it 'weather is either sunny or stormy' do
    airport = Airport.new
    expect(airport.weather).to eq('sunny').or eq('stormy')
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
    before { allow(airport.hanger).to receive(:length).and_return(10) }

    it 'should be full if the hanger is at capacity' do
      airport.check_capacity
      expect(airport).to be_full
    end
  end

  context "hanger is not at capacity" do
    airport = Airport.new
    before { allow(airport.hanger).to receive(:length).and_return(2) }

    it 'should be full if the hanger is at capacity' do
      airport.check_capacity
      expect(airport).not_to be_full
    end
  end

  context "weather is sunny" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('sunny') }    
    it 'should be return weather is sunny' do
      airport.check_weather
      expect(airport).to be_sunny
    end
  end

  context "weather is stormy" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('stormy') }
    it 'should return not weather sunny' do
      airport.check_weather
      expect(airport).not_to be_sunny
    end
  end

  context "airport is sunny and not full" do
    airport = Airport.new
    before { allow(airport).to receive(:sunny?).and_return(true) }
    before { allow(airport).to receive(:full?).and_return(false) }
    it 'should be clear for landing' do
      airport.set_landing_safety
      expect(airport).to be_clear_for_landing
    end
    it 'should be safe to take off' do
      airport.set_take_off_safety
      expect(airport).to be_clear_for_take_off
    end
  end

  context "airport is not sunny and full" do
    airport = Airport.new
    before { allow(airport).to receive(:sunny?).and_return(false) }
    before { allow(airport).to receive(:full?).and_return(true) }
    
    it 'should not be clear for landing' do
      airport.set_landing_safety
      expect(airport).not_to be_clear_for_landing
    end

    it 'should not be safe to take off' do
      airport.set_take_off_safety
      expect(airport).not_to be_clear_for_take_off
    end
  end

  context "airport is not sunny and not full" do
    airport = Airport.new
    before { allow(airport).to receive(:sunny?).and_return(false) }
    before { allow(airport).to receive(:full?).and_return(false) }
    
    it 'should not be clear for landing' do
      airport.set_landing_safety
      expect(airport).not_to be_clear_for_landing
    end

    it 'should not be safe to take off' do
      airport.set_take_off_safety
      expect(airport).not_to be_clear_for_take_off
    end
  end

  context "airport is sunny and full" do
    airport = Airport.new
    before { allow(airport).to receive(:sunny?).and_return(true) }
    before { allow(airport).to receive(:full?).and_return(true) }
    
    it 'should not be clear for landing' do
      airport.set_landing_safety
      expect(airport).not_to be_clear_for_landing
    end

    it 'should be safe to take off' do
      airport.set_take_off_safety
      expect(airport).to be_clear_for_take_off
    end
  end

  context "land plane" do
    it 'should land a plane' do
      airport = Airport.new
      plane = object_double(Plane.new)
      airport.land(plane)
      expect(airport.hanger).to include(plane)
    end
  end









end