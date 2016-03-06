require 'plane'
require 'airport'

describe "" do
  describe "# rspec feature test " do

    it "1.0 lands 10 Planes at gatwick" do
        heathrow = Airport.new
        gatwick = Airport.new

      allow(gatwick).to receive(:stormy?) {false}

        10.times{Plane.new.land(gatwick)}

      expect(gatwick.planes.size).to eq 10

    end

    it "2.0 land and take off 3 planes from gatwick" do

        heathrow = Airport.new
        gatwick = Airport.new

      allow(gatwick).to receive(:stormy?) {false}

        ba_110 = Plane.new
        ba_111 = Plane.new
        ba_112 = Plane.new

        ba_110.land(gatwick)
        ba_111.land(gatwick)
        ba_112.land(gatwick)

        ba_110.take_off(gatwick)
        ba_111.take_off(gatwick)
        ba_112.take_off(gatwick)

      expect(gatwick.planes.empty?).to be true

    end

    it "3.0 trying to call a plane from wrong airport raises ERROR" do

        heathrow = Airport.new
        gatwick = Airport.new

      allow(gatwick).to receive(:stormy?) {false}

        ba_110 = Plane.new
        ba_111 = Plane.new
        ba_112 = Plane.new

        ba_110.land(gatwick)
        ba_111.land(gatwick)
        ba_112.land(gatwick)

      expect{

           ba_110.take_off(heathrow)

      }.to raise_error "PLANE IS NOT AT THAT AIRPORT"

    end
  end
end
