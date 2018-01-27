require 'airport'

describe Airport do
  describe "#land" do

    before do
      @plane = Plane.new
      subject.land(@plane)
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should instruct a plane to land at the airport' do
      expect(subject.planes).to include(@plane)
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
      expect(subject.planes).not_to include(@plane)
    end
  end

  describe "#stormy weather: no takeoff" do

    



  end
end