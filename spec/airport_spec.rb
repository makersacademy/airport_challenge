 require 'airport'
 require 'weather'
 require 'plane'


describe Airport do
   subject(:airport) { described_class.new}
   let(:plane) { double :plane }



    it 'instructs the plane to land' do
      # airport = Airport.new
      expect(plane).to receive(:land)
      subject.land plane
    end

    it 'has the plane after landing' do
      airport = Airport.new
      expect(plane).to receive(:land)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    # allow(Plane.new).to receive(:land).and_return true


    it 'prevents the plane taking off' do
      # airport = Airport.new
      allow(:weather).to receive(:stormy?).and_return true
      message = 'cannot take off in stormy weather'
      expect { subject.take_off}.to raise_error message
    end


    it 'prevents landing when weather is stormy' do
      airport = Airport.new
      allow(:weather).to receive(:stormy?).and_return true
      message = 'Cannot land in stormy weather'
      expect { airport.land(plane) }.to raise_error message
    end


    it 'fails when the airport is #full' do
      # airport = Airport.new
      plane = Plane.new
      # airport.land(plane)
      error = 'Cannot land: airport is full'
      expect { plane.land }.to raise_error error
    end


    it 'raises an error when full' do
      6.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end


end
