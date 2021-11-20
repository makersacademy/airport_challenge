require 'plane'

describe Plane do
    
    it { is_expected.to respond_to :land_at_airport }

    it { is_expected.to respond_to :take_off_from_airport }

    it 'confirms if the plane is no longer in the airport' do
        subject.take_off_from_airport
        subject.in_airport?
        expect(subject).not_to be_in_airport
      end 

end 