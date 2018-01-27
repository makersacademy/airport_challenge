require 'airport'

describe Airport do
  describe "#land" do

    before do
      @plane = Plane.new
      subject.land(@plane)
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should instruct a plane to land at the airport' do
      expect(subject.hangar).to include(@plane)
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

    it 'should show that plane is no longer in the airport' do
      subject.take_off(@plane)
      expect(subject.hangar).not_to include(@plane)
    end
  end

  describe "#stormy weather: no takeoff or landing" do





  end

  describe "#hangar is full" do
    it 'should raise an error when hangar capacity is exceeded' do
      subject.capacity.times { subject.land Plane.new }
      expect{ subject.land Plane.new }.to raise_error("Hangar is at its full capacity")
    end
  end

  describe "#modification of capacity" do
    it 'should modify the default capacity as needed for other airports' do
      massive_airport = Airport.new(302)
      expect(massive_airport.capacity).to eq 302
    end
  end
end