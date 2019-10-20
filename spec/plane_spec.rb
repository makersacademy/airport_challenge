require 'plane'

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}

  context "Air traffic control has requested you lands," do

    it {is_expected.to respond_to(:land)}

    it 'does land method take an instance of Airport as an argument?' do
      expect{plane.land(airport)}.to_not raise_error
    end

    it 'once the land method is called, does the instance of airport (the argument) call the
    incoming_plane method and take the plane (self) as an argument?' do
      expect(airport).to receive(:incoming_plane).with(plane)
      plane.land(airport)
    end

    it {is_expected.to respond_to(:location)}

    it 'is the instance of airport saved to @location?' do
      plane.land(airport)
      expect(plane.location).to eq airport
    end


  end

  context "Air traffic control has requested you takes of," do

    it {is_expected.to respond_to(:take_off)}

    it 'once the take_off method is called, does the instance of airport (saved in @location) call the
      outgoing_plane method and take the plane (self) as an argument?' do
      plane.land(airport)
      expect(plane.location).to receive(:outgoing_plane).with(plane)
      plane.take_off
    end

    it 'so we know the plane is in the air is the string "air" saved to @location?' do
      airport.stub(:can_plane_take_off?) {false}
      plane.land(airport)
      plane.take_off
      expect(plane.location).to eq "air"
    end










  end

end
