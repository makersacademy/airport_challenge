require "plane"
require "airport"


describe Airport do 
    it 'instructs plane to land at airport' do 
        plane = Plane.new 
        airport = Airport.new 
        # subject.get_plane(plane) 
        allow(airport).to receive(:stormy_weather?).and_return false
        expect(airport.land(plane)).to eq [plane]
    end 

    it 'instruct plane to take off from airport' do 
        allow(subject).to receive(:stormy_weather?).and_return false
        plane= Plane.new 
        subject.take_off(plane)
        expect(subject.plane_gone).to eq (true)
    end 

    it 'does not allow planes to take off when weather is stormy' do 
        airport = Airport.new
        plane = Plane.new 
        allow(airport).to receive(:stormy_weather?).and_return true 
        expect { airport.take_off(plane) }.to raise_error 'weather is stormy, plane cannot take off'
    end 

    it 'does not allow planes to land when weather is stormy' do 
        airport = Airport.new
        plane = Plane.new 
        allow(airport).to receive(:stormy_weather?).and_return true 
        expect { airport.land(plane) }.to raise_error 'weather is stormy, plane cannot land'
    end 


    #WORKING CODE - when airport class does not have a default value
    # it 'prevents landing when airport is full ' do 
    #     plane = Plane.new()
    #     100.times{ subject.land(plane)}
    #     expect{ subject.land(plane)}.to raise_error 'Airport is full'

    # end 
    
    it 'airport has a default capacity/prevents landing when airport is full' do 
        allow(subject).to receive(:stormy_weather?).and_return false
        airport  = Airport.new
        plane = Plane.new 
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error 'Airport is full'
    end 

    
end 