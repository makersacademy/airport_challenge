require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  context 'plane requests to land' do

    it {is_expected.to respond_to(:incoming_plane)}

    it 'does incoming_plane method take an instance of Plane as argument?' do
      expect{airport.incoming_plane(plane)}.to_not raise_error
    end

    it {is_expected.to respond_to(:planes_at_airport)}

    it 'does incoming_plane method push argument (plane) into planes_at_airport array' do
    airport.incoming_plane(plane)
    expect(airport.planes_at_airport).to include(plane)
    end

  end

  context 'plane request to take off' do

    it {is_expected.to respond_to(:outgoing_plane)}

    it 'does incoming_plane method take an instance of Plane as argument?' do
      airport.stub(:can_plane_take_off?) {false}
      expect{airport.outgoing_plane(plane)}.to_not raise_error
    end

    it 'does outgoing_plane method remove argument (plane) from planes_at_airport array' do
      airport.stub(:can_plane_take_off?) {false}
      airport.incoming_plane(plane)
      airport.outgoing_plane(plane)
      expect(airport.planes_at_airport).to_not include(plane)
    end

    it 'does the user get noitfied when the plane has left the airport?' do
      airport.stub(:can_plane_take_off?) {false}
      airport.incoming_plane(plane)
      expect(airport.outgoing_plane(plane)).to eq "Plane has left airport"
    end



    it "does outgoing_plane method raise and error if its stormy?" do
      airport.stub(:can_plane_take_off?) {true}
      expect{airport.outgoing_plane(plane)}.to raise_error(RuntimeError)
    end



  end


end
