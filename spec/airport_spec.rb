require 'airport'

describe DockingStation do
  #let(:bike) { double :bike }

  it_behaves_like BikeContainer

  it 'raises error when no docked bike' do
    station = DockingStation.new
    expect{station.release_bike}.to raise_error("no bikes available")
  end

  it 'raises error when more than the capacity is docked' do
    #allow(double :bike).to receive(:working?).and_return(true)
    #allow(bike).to receive(:broken).and_return(false)
    bike = double("bike", :broken => false, :working? => true)
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {station.dock(bike)}
    bike1=bike
    expect{station.dock(bike1)}.to raise_error("the dock is full")
  end

  it 'sets default capacity' do
    station = DockingStation.new
    expect(station.capacity).to eq(20)
  end

  it 'sees unbroken bikes' do
    bike = double("bike", :broken => false, :working? => true)
    station1 = DockingStation.new
    bike1=bike
    station1.dock(bike1, false)
    expect(station1.bikes).to include bike1
  end

  it 'does not allow docking station to release broken bikes' do
    bike = double("bike", :broken => false, :working? => false)
    station1 = DockingStation.new
    bike1=bike
    station1.dock(bike1, true)
    expect{station1.release_bike}.to raise_error("no bikes available")
  end

  it 'can report broken bikes' do
    bike = double("bike", :broken => false, :working? => false)
    station1 = DockingStation.new
    bike1=bike
    station1.dock(bike1, true)
    expect(station1.brokenbikes).to include bike1
  end

end
