require 'plane'

describe Plane do

  describe '#land' do

    it 'lands at an airport' do
      fk_airport = double(:park_plane)
      expect(fk_airport).to receive :park_plane
      subject.land(fk_airport)
    end

    it "doesn't land unless flying" do
      fk_airport = double(:park_plane)
      subject.parked = true
      expect {
        subject.land(fk_airport)
      }.to raise_error('Plane is parked!')
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport if parked' do
      subject.parked = true
      fk_airport = double(:launch_plane)
      expect(fk_airport).to receive :launch_plane
      subject.takeoff(fk_airport)
    end

    it "doesn't takeoff unless parked" do
      fk_airport = double(:launch_plane)
      expect {
        subject.takeoff(fk_airport)
      }.to raise_error('Plane is already flying!')
    end

  end

end
