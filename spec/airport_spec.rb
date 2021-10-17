require_relative '../lib/airport'

describe Airport do 
  describe "adding shortcuts for rspec" do 
    let(:plane) { Plane.new }
    let(:airport) { Airport.new }
    let(:weather) { Weather.new }
    describe '#land_plane' do 
      it 'check airport can land a plane' do
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        expect(subject.land_plane(plane)[0][:plane]).to eq plane
      end 

      it 'prevents landing when weather is stormy' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(5)
        weather_message = weather.weather
        expect { subject.land_plane(plane) }.to raise_error "Not possible due to weather conditions: #{weather_message}"
      end 

      it 'checks if a plane has already landed' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        expect { subject.land_plane(plane) }.to raise_error "Plane has already landed"
      end 

    end 

    describe '#takeoff_plane' do 
      it 'checks a plane can take-off' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        expect(subject.takeoff_plane[:plane]).to eq plane
      end 

      it 'checks a plane is removed from the airport after takeoff' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        subject.takeoff_plane
        expect(subject.__send__(:planes_available)).to eq []
      end

      it 'throws a error if we try to deploy plane when none are available' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        expect { subject.takeoff_plane }.to raise_error 'No planes available'
      end 

      it 'prevents takeoff when weather is stormy' do  
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(5)
        weather_message = weather.weather
        expect { subject.takeoff_plane }.to raise_error "Not possible due to weather conditions: #{weather_message}"
      end 

      it 'check default airport before takeoff' do
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        expect(subject.takeoff_plane[:airport]).to eq 'Heathrow'
        
      end 

      it 'prevents takeoff if airports dont match' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.land_plane(plane)
        subject.instance_variable_set(:@airport, "Rochester")
        expect { subject.takeoff_plane }.to raise_error 'This plane is not stationed at this Airport'
      end 

      it 'checks if a plane is already in the sky' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        subject.instance_variable_set(:@skytraffic, [{ plane: 0x00007f911683f370, airport: "Heathrow" }])
        subject.instance_variable_set(:@planes_available, [{ plane: 0x00007f911683f370, airport: "Heathrow" }]) 
        expect { subject.takeoff_plane }.to raise_error "Plane is already in the air"
      end 

    end

    describe '#capacity' do 

      it { expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY } # checks capacity defaults to DEFAULT_CAPACITY
    
      it { expect(Airport.new(25).capacity).to eq 25 } # checks we can change capacity

      it 'throws a error if we try to store over capacity' do 
        allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
        airport = Airport.new(0)
        expect { airport.land_plane(plane) }.to raise_error 'Plane storage over capacity'
      end 

    end 

    describe 'feature tests' do 
      it 'Take off and land 3 planes expecting no errors' do 
        expect { 
          allow_any_instance_of(Object).to receive(:rand).with(7).and_return(1)
          plane1 = Plane.new
          plane2 = Plane.new
          plane3 = Plane.new
          subject.land_plane(plane1)
          subject.land_plane(plane2)
          subject.takeoff_plane
          subject.land_plane(plane3)
          subject.takeoff_plane
          subject.takeoff_plane 
        }.not_to raise_error
      end 
      
    end 
    
  end 
end 
