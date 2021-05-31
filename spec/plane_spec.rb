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

    it 'confirms that the plane is not inside an airport' do
        plane = Plane.new
        allow(plane).to receive(:ready_to_go?) {'clear'}
        plane.take_off

        expect(plane.status).to eq("flying")
    end

    it 'does not take off if the weather is "stormy"' do
      plane = subject
      airport = double(:airport, full: false)
      plane.land_at(airport)

      allow(plane).to receive(:weather) {'stormy'}
   
      expect {plane.take_off}.to raise_error "The weather is too stormy to fly!"
    end
  end

 
end