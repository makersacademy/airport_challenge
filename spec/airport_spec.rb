require 'airport'

# my second test - checks if class exists
describe Airport do
    it 'checks if airport exists' do
        expect(subject).to be_a Airport
    end

# my third test - checks if the class Airport responds to the method land_plane
    it 'responds to land_plane' do
        expect(subject).to respond_to :land
    end 
# one line syntax: it {is_expected.to respond_to :land}

    it { should respond_to(:land).with(1).argument } 

    it  { should respond_to(:take_off).with(1).argument }

    it 'stores a plane when landed' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.plane).to eq([plane])
    end

    it 'removes a plane when landed' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.plane).to eq([])
    end

    describe '#land' do 
        it 'raises an error to stop landing when airport is full' do
            Airport::DEFAULT_CAPACITY.times do 
                subject.land Plane.new
            end
            expect {subject.land Plane.new}.to raise_error "No space to land"
        end
    end


end 


# I would like a default airport capacity that can be overridden as appropriate
    
