require './lib/plane.rb'

describe Plane do

  it { is_expected.to respond_to(:land_at).with(2).arguments }
  it { is_expected.to respond_to(:take_off_from).with(2).arguments}
  it { is_expected.to respond_to(:taken_off?) }

  describe '#landing' do
    it "lands at the airport" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:land)
      expect(subject.land_at(airport, weather)).to eq true
    end
    it "prevents landing when stormy" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.land_at(airport, weather)}.to raise_error 'Landing not allowed due to stormy weather'
    end
    it "prevents landing when airport is full" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(airport).to receive(:full?).and_return(true)
      allow(weather).to receive(:stormy?).and_return(false)
      expect{ subject.land_at(airport,weather)}.to raise_error "Landing not permitted as airport is full"
    end
  end

  describe '#take off' do
    it "confirms that it has taken off" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:contains?).and_return(true)
      subject.take_off_from(airport, weather)
      expect(subject.taken_off?).to eq true
    end
    it "prevents takeoff when stormy" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off_from(airport, weather) }.to raise_error 'Take off not allowed due to stormy weather'
    end
    it "can only take off from airport it is in" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:land)
      subject.land_at(airport, weather)
      another_airport = Airport.new
      expect{ subject.take_off_from(another_airport, weather) }.to raise_error 'Plane is not at the airport'
    end
  end


end
