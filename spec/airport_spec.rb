require 'airport'
describe Airport do
    #land
    it {is_expected.to respond_to (:land)}
    it 'lands a plane' do 
        plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
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
  #####it 'takes of a plane' do 
     ####plane = Plane.new
    ### subject.land(plane)
   ## expect(subject.take_of(plane)).to ("plane has taken of")
    #end
    

         
    #off from an airport and confirm 
    #that it is no longer in the airport
end