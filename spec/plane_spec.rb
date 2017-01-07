require 'airport'

describe Airport do

  describe '#release_bike' do
    it 'releases bike' do
      should respond_to(:release_bike)
    end
    it 'releases bike if bike present' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
    it 'Errors when no bike present' do
      expect {subject.release_bike}.to raise_error("No bike present")
    end
    it 'refuses to release broken bike' do
      bike = double(:bike)
      subject.dock(bike, false)
      expect {subject.release_bike}.to raise_error("Refused: bike broken")
    end
  end

  describe '#working?' do

    it 'releases working bikes' do
      bike = double(:bike)
      expect(bike).to be_working
    end
    it 'successfully reports broken bikes' do
      subject.dock(bike, false)
      expect(bike.working?).to eq(false)
    end
  end

  describe '#dock' do

    it 'docks bike' do
      bike = double(:bike)
      should respond_to(:dock).with(1).argument
    end
    it 'verifies if bike has been docked' do
      current_no = subject.bikes.length
      expect(subject.dock(bike).length).to eq(current_no + 1)
    end
    it 'Errors when dock full' do
      subject.max_bikes.times { subject.dock double(:bike) }
      expect {subject.dock(bike)}.to raise_error("Dock full")
    end


    describe '#initialize' do
      it 'creates docking station with specified number of spaces' do
        station = DockingStation.new
        expect(station.max_bikes).to eq 20
      end
    end

  end

end
