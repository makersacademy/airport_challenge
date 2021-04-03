require 'airport'
describe Airport do
    #land
    it {is_expected.to respond_to (:land)}
    it 'lands a plane' do 
        plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
    end
    it 'doesnt land planes when its full' do
        ::DEFAULT_CAPACITY.times {subject.land Plane.new }
   expect { subject.land Plane.new }.to raise_error('full')
  end
    #take of
    it {is_expected.to respond_to (:take_of) }
    
  it 'takes of a plane' do 
        @planes = []
        plane = Plane.new
        subject.land(plane)
        @planes << plane
        subject.take_of(plane)
        @planes.delete(plane)
        expect(@planes).not_to include(plane)
    end

    
        
        
        
        
        #plane = Plane.new
        
        #expect(subject.land(plane)).to raise("its full")
    #end

  
    
       
         
    #off from an airport and confirm 
    #that it is no longer in the airport missing this on the take of part
end