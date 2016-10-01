require 'plane'
require 'airport'

describe Airport do

let (:plane) {Plane.new}

    describe 'initialization' do
          subject {Airport.new}
          it 'has a default capacity' do
          described_class::DEFAULT_CAPACITY.times { plane.take_off_and_land(subject) }
          expect{ plane.take_off_and_land(subject) }.to raise_error 'Airport full!'
          end

            it 'can have a set capacity' do
              ap = Airport.new(45)
              45.times { plane.take_off_and_land(ap) }
              expect{ plane.take_off_and_land(ap) }.to raise_error 'Airport full!'
            end

      end









end
