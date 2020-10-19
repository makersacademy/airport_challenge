require 'airport'
require 'plane'

RSpec.describe do

  describe 'feature_test' do
    it 'handles many situations' do
      given_4_planes_are_at_the_airport
      when_the_weather_turns_bad
      three_planes_are_turned_away
      when_the_weather_turns_good
      three_land
      and_another_three_land
      another_is_denied_landing
      one_takes_off
      then_another_lands
    end

    def given_4_planes_are_at_the_airport
      @airport = Airport.new
      one = Plane.new
      two = Plane.new
      three = Plane.new
      four = Plane.new
      [one, two, three, four].each do |x|
        @airport.planes << x
      end
      expect(@airport.planes.length).to eq 4
    end

    def when_the_weather_turns_bad
      allow_any_instance_of(Airport).to receive(:rand).and_return(1)
      expect(@airport.weather_bad?).to eq true
    end

    def three_planes_are_turned_away
      3.times {
        plane = Plane.new
        @airport.land(plane)
      }
      expect(@airport.planes.length).to eq 4
    end

    def when_the_weather_turns_good
      allow_any_instance_of(Airport).to receive(:rand).and_return(5)
      20.times {
        expect(@airport.weather_bad?).to eq false
      }
    end

    def three_land
      five = Plane.new
      @six = Plane.new
      seven = Plane.new
      [five, @six, seven].each do |plane|
        @airport.planes << plane
      end
      expect(@airport.planes.length).to eq 7
    end

    def and_another_three_land
      eight = Plane.new
      nine = Plane.new
      ten = Plane.new
      [eight, nine, ten].each do |plane|
        @airport.planes << plane
      end
      expect(@airport.planes.length).to eq 10
    end

    def another_is_denied_landing
      eleven = Plane.new
      expect(@airport.land(eleven)).to eq "Airport full, go away."
      expect(@airport.planes.length).to eq 10
    end

    def one_takes_off
      @airport.takeoff(@six)
      expect(@airport.planes.length).to eq 9
    end

    def then_another_lands
      twelve = Plane.new
      @airport.land(twelve)
      expect(@airport.planes.length).to eq 10
    end
  end

end
