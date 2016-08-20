require 'Plane.rb'

describe Plane do
  let(:airport) {double :airport}
  let(:good_weather) {double :good_weather}
  let(:bad_weather) {double :bad_weather}

  before(:each) do
    allow(good_weather).to receive(:stormy?).and_return(false)
    allow(bad_weather).to receive(:stormy?).and_return(true)
    allow(airport).to receive(:capacity).and_return(40)
  end

  describe '.land_at' do
    it 'allows planes to land at a specific Airport' do
      subject.land_at(airport, good_weather)
      expect(subject.location).to eq airport
    end

    it 'it does not allow planes to land when weather is bad' do
      subject.land_at(airport, bad_weather)
      expect(subject.location).to eq(nil)
    end


    it 'is possible to confirm if the plane has landed at an airport' do
      subject.land_at(airport, good_weather) #making sure the
      expect(subject.confirm_location).to eq("The plane is currently at #{airport}.")
    end

    it 'confirms that the plane has landed when it successfully lands' do
      expect(subject.land_at(airport, good_weather)).to eq("The plane is currently at #{airport}.")
    end
  end

  describe '.take_off' do
    it 'confirms it has taken off when it successfully takes off' do
      subject.land_at(airport, good_weather)
      expect(subject.take_off(good_weather)).to eq("The plane is currently in the air.")
    end

    it 'does not take off when the weather is bad' do
      subject.land_at(airport, good_weather)
      expect(subject.take_off(bad_weather)).to eq("Can not take off in stormy weather. The plane is currently at #{airport}.")
    end
  end

end
