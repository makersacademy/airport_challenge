require "plane"
require "airport"


describe Airport do 
    it 'instructs plane to land at airport' do 
        plane = Plane.new 
        aiport = Airport.new 
        # subject.get_plane(plane) 
        expect(aiport.land(plane)).to eq [plane]
    end 

    #WORKING CODE - before the weather user story was implimeneted 
    # it 'instruct plane to take off from airport' do 
    #     plane= Plane.new 
    #     subject.take_off(plane)
    #     expect(subject.plane_gone).to eq (true)
    # end 

    it 'plane cannot take off it weather is stormy' do 
        plane = Plane.new 
        subject.take_off(plane)
        allow(subject.take_off(plane)).to receive(subject.weather) {'stormy'}
        expect{ subject.take_off(plane) }.to raise_error 'Weather is stormy, plane cannot take off'
    end
    # RuntimeError: - Weather is stormy, plane cannot take off


    #WORKING CODE - when airport class does not have a default value
    # it 'prevents landing when airport is full ' do 
    #     plane = Plane.new()
    #     100.times{ subject.land(plane)}
    #     expect{ subject.land(plane)}.to raise_error 'Airport is full'

    # end 
    
    it 'airport has a default capacity/prevents landing when airport is full' do 
        # airport  = Airport.new  - I used subject instead of airport 
        plane = Plane.new 
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error 'Airport is full'
    end 
  





    # it 'the default airport capacity can be overridden' do 

    # end 



    # it 'if weather is stormy, do not takeoff ' do 
    #     plane = Plane.new
    #     allow(subject.weather).to receive(:weather) {'stormy'}
    #     expect{ subject.weather}.to raise_error 'weather is stormy, cannot takeoff'
    # end 

    
end 