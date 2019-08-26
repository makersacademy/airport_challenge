require './lib/plane.rb'

describe Plane do

  it { is_expected.to respond_to(:land_at).with(2).arguments }
  it { is_expected.to respond_to(:take_off_from).with(2).arguments}
  it { is_expected.to respond_to(:in_air?) }

  describe '#landing' do
    it "lands at the airport" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:land)
      subject.land_at(airport, weather)
      expect(subject.in_air?).to eq(false)
    end
    it "cannot land when stormy" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.land_at(airport, weather)}.to raise_error 'Landing not allowed due to stormy weather'
    end
  end

  describe '#take off' do
    it "confirms that it has taken off" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:contains?).and_return(true)
      allow(airport).to receive(:takeoff)
      subject.take_off_from(airport, weather)
      expect(subject.in_air?).to eq true
    end
    it "cannot takeoff when stormy" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off_from(airport, weather) }.to raise_error 'Take off not allowed due to stormy weather'
    end
    it "can not take off if already flying" do
      airport = instance_double("Airport")
      weather = instance_double("Weather")
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:contains?).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      allow(subject).to receive(:in_air?).and_return(true)
      expect{ subject.take_off_from(airport, weather) }.to raise_error 'Plane has already taken off'
    end
  end


end
