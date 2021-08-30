require './lib/airport.rb'

describe Airport do
    it { is_expected.to respond_to(:take_off) }
 
    it 'should have a default capacity' do
        expect(subject.default_capacity).to eq Airport::DEFAULT_CAPACITY
    end 

    describe '#land_plane' do
      it { is_expected.to respond_to :land_plane }
      it 'raises an error if airport full' do
         5.times { subject.land_plane Plane.new }
         expect { subject.land_plane Plane.new }.to raise_error 'The airport is full'
      end 
    end
end 


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
