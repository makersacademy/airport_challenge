require 'airport'

RSpec.describe Airport do
  describe 'A group of tests that need an instance of Airport, Plane and Weather' do    
    before(:example) do
      @plane = Plane.new
      @airport = Airport.new
      @weather = Weather.new
    end

    describe 'Landing a plane in good weather' do
      before(:example) do
        allow(@weather).to receive(:stormy?).and_return(false)
      end

      it 'plane can land' do
        expect(@airport.land(@plane, @weather)).to eq [@plane]
      end
      
      it 'landed plane is in the airport' do
        @airport.land(@plane, @weather)
        expect(@airport.planes).to include @plane
      end
  
      it 'Plane cannot land if it is already landed' do
        @airport.land(@plane, @weather)
        expect { @airport.land(@plane, @weather) }.to raise_error 'Plane has already landed'
      end
    end
  
    describe 'Planes taking off in good weather' do
      before(:example) do
        allow(@weather).to receive(:stormy?).and_return(false)
      end

      it 'plane can take off' do
        @airport.land(@plane, @weather)
        allow(@weather).to receive(:stormy?).and_return(false)
        expect(@airport.take_off(@plane, @weather)).to be_a Plane
      end
       
      
      it 'checks plane has taken off' do
        @airport.land(@plane, @weather)
        allow(@weather).to receive(:stormy?).and_return(false)
        @airport.take_off(@plane, @weather)
        expect(@airport.taken_off?(@plane)).to eq true
      end
  
      it 'planes can only take off from airport they are in' do
        expect { @airport.take_off(@plane, @weather) }.to raise_error 'Plane is not in airport'
      end
      
      it 'taken off plane can not be in airport' do
        expect(@airport.planes).to_not include @plane
      end
    end
           
    context 'Weather is stormy' do
      it 'raises error trying to takeoff in stormy weather' do
        allow(@weather).to receive(:stormy?).and_return(false)
        @airport.land(@plane, @weather) 
        allow(@weather).to receive(:stormy?).and_return(true)
        expect { @airport.take_off(@plane, @weather) }.to raise_error 'Turbulent weather cannot takeoff'
      end
       
      it 'raises error when trying to land in stormy weather' do
        allow(@weather).to receive(:stormy?).and_return(true)
        expect { @airport.land(@plane, @weather) }.to raise_error 'Turbulent weather cannot land'
      end
    end
  
    context 'Weather is not stormy' do
      before(:example) do
        allow(@weather).to receive(:stormy?).and_return(false)
      end
      it 'no error raised when taking off in normal weather' do
        @airport.land(@plane, @weather) 
        allow(@weather).to receive(:stormy?).and_return(false)
        expect { @airport.take_off(@plane, @weather) }.to_not raise_error
      end
       
      it 'no error raised when landing in normal weather' do
        expect { @airport.land(@plane, @weather) }.to_not raise_error
      end
    end
  end

  context 'Airport is full' do
  
    it 'raises error when airport is full' do
      airport = Airport.new
      weather = Weather.new
      Airport::DEFAULT_CAPACITY.times do
        allow(weather).to receive(:stormy?).and_return(false)
        airport.land(Plane.new, weather)
      end
      allow(weather).to receive(:stormy?).and_return(false)
      expect { airport.land(Plane.new, weather) }.to raise_error 'Airport is full'
    end
  end
       
end
