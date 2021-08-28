require './lib/airport.rb'

describe Airport do
    it { is_expected.to respond_to(:take_off) }

    describe '#land_plane' do
      it { is_expected.to respond_to :land_plane }
      it 'raises an error if airport full' do
         5.times { subject.land_plane Plane.new }
         expect { subject.land_plane Plane.new }.to raise_error 'The airport is full'
      end 
    end
end 
