require 'plane'
require 'airport'
require 'weather'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:confirm_landing) }
  it { is_expected.to respond_to(:confirm_take_off) }
  it { is_expected.to respond_to(:current_status) }
  it { is_expected.to respond_to(:able_to_take_off?).with(1).argument }

  describe "airport double" do
    before :each do
      @airport = double("airport", :full? => false, :planes => [])
    end

  describe '#current_status' do
    before :each do
      subject.land(@airport)
    end

    it "expects current_status to indicate when plane is in airport" do
      expect(subject.current_status).to eq "In airport"
    end

    it "expects current_status to indicate when plane is in the air" do
      subject.take_off(@airport)
      expect(subject.current_status).to eq "In air"
    end
  end


    describe '.able_to_land?' do
      it "planes cannot land in an airport if they are already in an airport" do
        subject.land(@airport)
        expect(subject).not_to be_able_to_land
      end
    end

    describe '.able_to_take_off?' do
      it "checks if plane is in the specified airport" do
        expect(subject).not_to be_able_to_take_off(@airport)
      end
    end



  describe '.land' do

    it "lands the plane in an airport" do
      expect(subject.land(@airport)).to eq "Plane has landed"
    end

    it "raises exception if plane is not in air" do
      subject.land(@airport)
      expect{subject.land(@airport)}.to raise_error "Plane is already in airport"
    end

    it "raises exception if airport is full" do
      allow(@airport).to receive(:full?).and_return(true)
      expect{subject.land(@airport)}.to raise_error "Airport is full"
    end

    it "prevents landing if weather is stormy" do
      allow(subject).to receive(:unsuitable_weather?).and_return(true)
      expect{subject.land(@airport)}.to raise_error "Plane cannot land due to stormy weather"
    end

    it "allows landing if weather is not stormy" do
      allow(subject).to receive(:unsuitable_weather?).and_return(false)
      expect{subject.land(@airport)}.not_to raise_error
    end
  end

  describe '.take_off' do

    it "removes the plane from its current airport" do
      subject.land(@airport)
      subject.take_off(@airport)
      expect(@airport.planes).to eq []
    end

    it "prevents take off unless the plane is in the airport" do
      expect{subject.take_off(@airport)}.to raise_error "Plane is not in this airport"
    end

    it "prevents take off if the weather is stormy" do
      subject.land(@airport)
      allow(subject).to receive(:unsuitable_weather?).and_return(true)
      expect{subject.take_off(@airport)}.to raise_error "Plane cannot take off due to stormy weather"
    end

    it "allows take off if the weather is not stormy" do
      subject.land(@airport)
      allow(subject).to receive(:unsuitable_weather?).and_return(false)
      expect{subject.take_off(@airport)}.not_to raise_error
    end
  end

end

  describe "unsuitable_weather?" do

    it "checks if weather is clear" do
      allow(subject).to receive(:unsuitable_weather?).and_return(false)
      expect(subject.unsuitable_weather?).to eq false
    end

    it "checks if weather is stormy" do
      allow(subject).to receive(:unsuitable_weather?).and_return(true)
      expect(subject.unsuitable_weather?).to eq true
    end
  end

  describe '.confirm_landing' do
    it "confirms that the plane has landed" do
      expect(subject.confirm_landing).to eq "Plane has landed"
    end
  end

  describe '.confirm_take_off' do
    it "confirms that the plane has taken off" do
      expect(subject.confirm_take_off).to eq "Plane has taken off"
    end
  end


end
