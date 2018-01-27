require 'airport'

describe Airport do
  describe "#landing" do

    before do
      @plane = Plane.new
      subject.land(@plane)
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should instruct plane to land at the airport' do
      expect(subject.hangar).to include(@plane)
    end

    it 'should not allow plane to land again if in hangar' do
      expect{ subject.land(@plane) }.to raise_error("Already in hangar")
    end
  end

  describe "#take_off" do

    before do
      @plane = Plane.new
      subject.land(@plane)
    end

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should instruct plane to take off' do
      expect(subject.take_off(@plane)).to eq "#{@plane} has just taken off"
    end

    it 'should output plane is no longer at the airport' do
      subject.take_off(@plane)
      expect(subject.hangar).not_to include(@plane)
    end

    it 'should raise error if plane takes off from wrong airport' do
      another_airport = Airport.new
      expect{ another_airport.take_off(@plane) }.to raise_error("Plane not in hangar")
    end
  end

  describe "#stormy weather: no takeoff or landing" do

    before do
      # Roll the die
    end

    it 'should prevent takeoff when weather is stormy'


  end

  describe "#hangar is full" do
    it 'should raise error when hangar capacity is exceeded' do
      subject.capacity.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error("Hangar is at its full capacity")
    end
  end

  describe "#modification of capacity" do
    it 'should modify default capacity as needed for other airports' do
      massive_airport = Airport.new(302)
      expect(massive_airport.capacity).to eq 302
    end
  end
end