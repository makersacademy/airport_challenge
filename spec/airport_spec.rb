require 'airport'
require 'plane'

describe Airport do

  describe 'messages that are handled' do

    it { is_expected.to respond_to(:land).with(1).argument } # message from ATC

    it { is_expected.to respond_to(:take_off).with(1).argument } # message from ATC

    it { is_expected.to respond_to :full? }

    it 'confirms that it has changed state to full' do
      pending 'need to complete logic of fullness'
      subject.full?
      expect(subject).to be_full
    end

    it 'confirms that it has changed state to not full' do
      subject.full?
      expect(subject).to_not be_full
    end

  end

  describe 'airport behaviour' do

    it 'lands a plane with nice weather and when the airport is not full' do
      flying_plane = Plane.new landed=false

      nice_weather = double(:weather)
      allow(nice_weather).to receive(:stormy?).and_return(false)
      subject.weather = nice_weather

      allow(subject).to receive(:full?).and_return(false)

      subject.land(flying_plane)
      expect(flying_plane).to be_landed
    end

    it "doesn't land a plane with nice weather and when the airport is full" do
      flying_plane = Plane.new landed=false

      nice_weather = double(:weather)
      allow(nice_weather).to receive(:stormy?).and_return(false)
      subject.weather = nice_weather

      allow(subject).to receive(:full?).and_return(true)

      subject.land(flying_plane)
      expect(flying_plane).to_not be_landed
    end

    it "doesn't a plane with bad weather and when the airport is not full" do
      flying_plane = Plane.new landed=false

      bad_weather = double(:weather)
      allow(bad_weather).to receive(:stormy?).and_return(true)
      subject.weather = bad_weather

      allow(subject).to receive(:full?).and_return(false)

      subject.land(flying_plane)
      expect(flying_plane).to_not be_landed
    end

    it "doesn't a plane with bad weather and when the airport is full" do
      flying_plane = Plane.new landed=false

      bad_weather = double(:weather)
      allow(bad_weather).to receive(:stormy?).and_return(true)
      subject.weather = bad_weather

      allow(subject).to receive(:full?).and_return(true)

      subject.land(flying_plane)
      expect(flying_plane).to_not be_landed
    end
    it 'will show a full status when full'
  end
end
