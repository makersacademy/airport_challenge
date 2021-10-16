require './lib/airport'

subject(:airport) { decribed_class.new }
    # plane = Plane.new

    describe Airport do
        it 'lands plane' do
          airport = Airport.new
          expect { subject.to respond.to(:land).with(1).argument }
        end
    end
