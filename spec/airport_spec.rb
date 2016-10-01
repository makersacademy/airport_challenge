#require 'docking_station'
require 'airport'





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