require 'plane'
require 'airport'

describe Airport do

    describe 'initialization' do
        subject {Airport.new}
        it 'has a default capacity' do
          plane = Plane.new
          described_class::DEFAULT_CAPACITY.times {Plane.new.land(subject)}
          expect{ plane.land(subject) }.to raise_error 'Airport full!'
        end

    end


          it 'has a set capacity' do
            ap = Airport.new(45)
            plane = Plane.new
            45.times {Plane.new.land(ap)}
            expect{ plane.land(ap) }.to raise_error 'Airport full!'
          end


end
