require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {object_double(Plane.new)}

  it 'weather is either sunny or stormy' do
    expect(airport.weather).to eq('sunny').or eq('stormy')
  end

  context "checking weather" do
    before { allow(airport).to receive(:weather).and_return('sunny') }
    it 'should return true' do
      expect(airport.check_weather).to be true
    end
  end

  it 'is initialised with a capacity argument that can override default' do
    airport = Airport.new(100)
    expect(airport.instance_variable_get(:@capacity)).to eq(100)
  end

  it 'is initialised with a instance variable to hold planes' do
    expect(airport.instance_variable_get(:@hanger)).to be_an_instance_of(Array)
  end

  context "hanger should be at capacity" do
    before { allow(airport.hanger).to receive(:length).and_return(10) }
    it 'should be full if the hanger is at capacity' do      
      expect(airport.check_capacity).to be true
    end
  end

  context "hanger should not be at capacity" do
    before { allow(airport.hanger).to receive(:length).and_return(2) }
    it 'should not be at capacity' do      
      expect(airport.check_capacity).to be false
    end
  end

  context "clear for landing" do
    before { allow(airport).to receive(:check_weather).and_return(true) }
    before { allow(airport).to receive(:check_capacity).and_return(false) }
    before { allow(airport).to receive(:check_hanger).and_return(false) }
    before { allow(plane).to receive(:at_airport).and_return(false) }
    it 'should be clear for landing' do
      expect(airport.clear_for_landing(plane)).to be true
    end
  end

  context "not clear for landing" do
    before { allow(airport).to receive(:check_weather).and_return(false) }
    before { allow(airport).to receive(:check_capacity).and_return(false) }
    before { allow(airport).to receive(:check_hanger).and_return(false) }
    before { allow(plane).to receive(:at_airport).and_return(true) }
    it 'should not be clear for landing' do
      expect(airport.clear_for_landing(plane)).not_to be true
    end
  end

  context "clear for take-off" do
    before { allow(airport).to receive(:check_weather).and_return(true) }
    before { allow(airport).to receive(:check_hanger).and_return(true) }
    it 'should be clear for take-off' do
      expect(airport.clear_for_take_off(plane)).to be true
    end
  end

  context "not clear for take-off" do
    before { allow(airport).to receive(:check_weather).and_return(false) }
    before { allow(airport).to receive(:check_hanger).and_return(true) }

    it 'should not be clear for take-off' do
      expect(airport.clear_for_take_off(plane)).to be false
    end
  end

  context "ok to land plane" do
    before { allow(airport).to receive(:clear_for_landing).and_return(true) }
    before { allow(plane).to receive(:in_hanger) }
    it 'should put the plane in the hanger' do
      airport.land(plane)
      expect(airport.hanger).to include(plane)
    end
  end

  context "not ok to land plane" do
    before { allow(airport).to receive(:clear_for_landing).and_return(false) }
    before { allow(plane).to receive(:in_hanger) }
    it 'plane should not be in the hanger' do
      airport.land(plane)
      expect(airport.hanger).not_to include(plane)
    end
  end

  context "ok to take off" do
    before { allow(airport).to receive(:clear_for_landing).and_return(true) }
    before { allow(airport).to receive(:clear_for_take_off).and_return(true) }
    before { allow(plane).to receive(:in_hanger) }
    before { allow(plane).to receive(:not_in_hanger) }
    it 'should put the plane in the hanger' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hanger).not_to include(plane)
    end
  end

  # context "not ok to take off" do
  #   before { allow(airport).to receive(:clear_for_landing).and_return(true) }
  #   before { allow(airport).to receive(:clear_for_take_off).and_return(false) }
  #   before { allow(plane).to receive(:in_hanger) }
  #   it 'plane should remain in the hanger' do
  #     airport.land(plane)
  #     airport.take_off(plane)
  #     expect(airport.hanger).to include(plane)
  #   end
  # end


end