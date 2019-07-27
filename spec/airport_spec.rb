require 'airport'

describe AirportController do
    it 'lands a plane' do
        plane = Plane.new
        #subject here is airport
        subject.land(plane)
        expect(subject.land(plane)).to eq plane
      end
      #plane method on docking_station
      it { is_expected.to respond_to(:plane) }
end