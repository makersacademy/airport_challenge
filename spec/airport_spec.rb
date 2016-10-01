#require 'docking_station'
require 'airport'

describe Airport do
    
    describe "- Airport sends instructions to land." do
        
        it { is_expected.to respond_to :land_plane}         #.with (1).argument
        
        plane = Plane.new
        it "Plane returns a status of 'down' when it lands." do
            allow(subject).to receive(:airport_open?){true}           #This removes random weather factor.
            expect(subject.land_plane(plane)).to eq "down"
        end    
    
    end
    
    describe "- Plane instructed to take-off." do
        
        

        it {is_expected.to respond_to :take_off}
        
        it "Plane returns a status of 'up' when it takes-off." do
            subject.planes << Plane.new
            allow(subject).to receive(:airport_open?){true}           #This removes random weather factor.
            expect(subject.take_off).to eq "up"
        end
    end
    describe "- Plane instructed to land when there is no plane." do
        it "Plane does not land if there is no plane object." do
            plane = nil
            plane = "123456789"
            expect{subject.land_plane(plane)}.to raise_error("ERROR: There is no plane to land.")
        end
    end
    
#=begin    
    describe "- Plane instructed to take-off when there is no plane." do
        it "Plane does not take off if there are no planes in the airport" do
            subject.planes = []     #Empty array of planes at airport.
            expect{subject.take_off}.to raise_error "ERROR: There is no plane to take-off."
        end
    end
#=end    
end



=begin
describe DockingStation do

  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do

    it 'releases a bike' do
      #bike = Bike.new
      bike = Plane.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end



  end

   describe '#dock' do
     it 'raises an error when there is a bike in that docking station' do
       #subject.capacity.times { subject.dock(Bike.new) }
       subject.capacity.times { subject.dock(Plane.new) }
       #expect { subject.dock Bike.new }.to raise_error 'Docking station full'
       expect { subject.dock Plane.new }.to raise_error 'Docking station full'
     end
   end

  it 'releases working bikes' do
    #bike = Bike.new
    bike = Plane.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

   it 'docks something' do
    #bike = Bike.new
    bike = Plane.new
    #return the bike we dock back
    expect(subject.dock(bike)).to eq [bike]

  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    #let(:bike) { Bike.new }
    let(:bike) { Plane.new }
    it 'defaults capacity' do
     described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
     end
     expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
end


  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

end


=end