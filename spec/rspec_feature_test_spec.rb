require 'plane'
require 'airport'

describe "" do
  describe "# rspec feature test " do

    it "1.0 USER STORY 1 - lands 10 Planes at gatwick" do

        heathrow = Airport.new
        gatwick = Airport.new

      allow(gatwick).to receive(:stormy?) {false}

        10.times{Plane.new.land(gatwick)}

      expect(gatwick.planes.size).to eq 10

    end

    it "2.0 USER STORY 2 - land and take off 3 planes from gatwick" do

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

    it "3.0 USER STORY 3 - Can't land in a storm (ERROR)" do

        gatwick = Airport.new

    allow(gatwick).to receive(:stormy?) {true}

        ba_120 = Plane.new

        expect {

          ba_120.land(gatwick)

        }.to raise_error "CANNOT LAND IN A STORM"

    end

    it "4.0 USER STORY 4 - Can't take_off in a storm (ERROR)" do

        gatwick = Airport.new

    allow(gatwick).to receive(:stormy?) {false}

        ba_130 = Plane.new

        ba_130.land(gatwick)

    allow(gatwick).to receive(:stormy?) {true}

        expect {

          ba_130.take_off(gatwick)

        }.to raise_error "CANNOT TAKE-OFF IN A STORM"

    end

    it "5.0 USER STORY 5 - Can't land if airport full (ERROR)" do

        gatwick = Airport.new(0)

    allow(gatwick).to receive(:stormy?) {false}

        ba_130 = Plane.new

        expect {

          ba_130.land(gatwick)

        }.to raise_error "CANNOT LAND AIRPORT IS FULL"

    end

    it "6.0 USER STORY 6 - User can set capacity parameter" do

        gatwick = Airport.new(40)

        expect(gatwick.capacity).to eq 40

    end

    it "7.0 EDGE CONDITION - trying to call a plane from wrong airport raises ERROR" do

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
