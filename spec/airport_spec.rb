require 'airport.rb'
require 'plane.rb'
  describe Airport do
  it { is_expected.to respond_to :take_off }

  describe '#take_off' do
    it 'allows a plane to take off if one is available' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
     end
     it 'raises error if no planes are available' do
       expect { subject.take_off }.to raise_error "No planes available"
     end
     it "doesn't allow a plane to take off in bad weather" do
       plane1 = Plane.new
       plane2 = Plane.new
       plane1.report_bad_weather
       subject.land_plane(plane1)
       subject.land_plane(plane2)
       test_plane = subject.take_off
       expect(test_plane.good_weather?).to eq true
     end
 end

   it { is_expected.to respond_to(:land_plane).with(1).argument }
   it { is_expected.to respond_to(:airport) }


  describe '#land_plane' do
    it 'allows plane to land if airport is not full' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq "Plane has landed"
    end
    it 'raises an error if a plane tries to land when capacity is full' do
      20.times {subject.land_plane Plane.new}
      expect { subject.land_plane(Plane.new) }.to raise_error "Airport full"
    end
    #it 'docks a broken bike' do
    #  bike = Bike.new
    #  bike.report_broken_bike
    #  subject.dock(bike)
    #  expect(subject.station.length).to eq 1
    #end
  end

  describe '#initialize' do
    it 'sets the capacity to 10' do
      heathrow = Airport.new(10)
      expect(heathrow.capacity).to eq 10
    end
  end

end

describe Plane do
  describe '#report_bad_weather' do
    it 'tells us that weather is bad' do
      plane = Plane.new
      plane.report_bad_weather
      expect(plane.good_weather?).to eq false
    end
  end
end
