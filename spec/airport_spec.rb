require './lib/airport'

    # plane = Plane.new

    describe Airport do
      subject (:airport) { decribed_class.new }

      it 'lands plane' do
        airport = Airport.new
        expect { (airport).to respond.to(:land).with(1).argument }
      end

      it 'allows planes to take off' do
      expect { (airport).to respond.to(:take_off).with(1).argument }
      end 

    end
