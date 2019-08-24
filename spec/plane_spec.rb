require './lib/plane.rb'

describe Plane do

  let (:airport) { double :airport }
  let (:weather) { double :weather }

  it { is_expected.to respond_to(:land_at).with(1).arguments }
  it { is_expected.to respond_to(:take_off_from).with(2).arguments}
  it { is_expected.to respond_to(:taken_off?) }

  it "lands at the airport" do
    expect(subject.land_at(airport)).to eq true
  end

  describe '#take off' do
    it "confirms that it has taken off" do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.take_off_from(airport, weather)
      expect(subject.taken_off?).to eq true
    end
    it "prevents takeoff when stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off_from(airport, weather) }.to raise_error 'Take off not allowed due to stormy weather'
    end
  end


end
