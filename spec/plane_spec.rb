require 'plane'

RSpec.describe Plane do

  it 'creates an instance of plane' do
    expect(subject).not_to eq(nil)
  end

  describe 'landings at the airport' do

    it { is_expected.to respond_to :land_at }

    it 'does not land a plane if airport is full' do 
      
      airport = double(:airport, full: true)
      plane = Plane.new

      expect {plane.land_at(airport)}.to raise_error "Unable to land, the airport is full!"
     
    end

  end

  describe 'take offs from the airport' do

    it { is_expected.to respond_to :take_off }

    it 'confirms that the plane is not inside an airport' do
        plane = subject
        plane.take_off

        expect(plane.status).to eq("flying")
    end
  end
end