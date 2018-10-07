require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to :take_off }
  describe '#take_off' do
    it 'allows a plane to take off if one is available' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
    end
    it "raises error if no planes are available" do
      expect { subject.take_off }.to raise_error "No planes available"
    end
  end

     it { is_expected.to respond_to(:land_plane).with(1).argument }
     it { is_expected.to respond_to(:plane) }

  describe '#land_plane' do
     it 'lets a plane land if station is not full' do
       plane = Plane.new
       expect(subject.land_plane(plane)).to eq "Plane landed"
     end
     it "raises an error if the airport capacity is full" do
      20.times {subject.land_plane Plane.new}
       expect { subject.land_plane(Plane.new) }.to raise_error "Airport full"
     end
   end
end
