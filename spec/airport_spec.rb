require 'airport'

describe Airport do

  let(:plane) {:plane}
  let(:aerlingus) {:aerlingus}

  describe "#land" do
    it 'lands a plane' do
      expect(subject.land(:plane)).to eq [:plane]
    end

    it 'stops a plane from landing if stormy' do
      condition = Weather.new
      allow_any_instance_of(Weather).to receive(:forecast).and_return(:stormy)
      subject.weather_conditions(condition)
      expect{subject.land(:plane)}.to raise_error("Too stormy to land!")
    end

    it 'allows a plane to land if fine' do
      condition = Weather.new
      allow_any_instance_of(Weather).to receive(:forecast).and_return(:fine)
      subject.weather_conditions(condition)
      expect(subject.land(:plane)).to eq [:plane]
    end

    it 'stops a plane from landing if airport full' do
      subject.capacity.times{subject.land(:aerlingus)}
      expect{subject.land(:plane)}.to raise_error("Can't land airport full.")
    end
  end

  describe '#landed?' do
    it 'checks if a specific plane has landed' do
      subject.land(:plane)
      expect(subject.landed?(:plane)).to eq true
    end

    it 'expects the plane to have taken off' do
      subject.land(:plane)
      subject.land(:aerlingus)
      subject.take_off(:plane)
      expect(subject.landed?(:plane)).to eq false
      expect(subject.landed?(:aerlingus)).to eq true
    end
  end

  describe "#take_off" do
    it 'allows multiple planes to take off' do
      subject.land(:plane)
      subject.land(:aerlingus)
      expect(subject.take_off(:plane)).to eq :plane
      expect(subject.take_off(:aerlingus)).to eq :aerlingus
    end

    it 'allows a plane to take off if fine' do
      condition = Weather.new
      allow_any_instance_of(Weather).to receive(:forecast).and_return(:fine)
      subject.land(:plane)
      subject.weather_conditions(condition)
      expect(subject.take_off(:plane)).to eq :plane
    end

    it "doesn't allow plane to take off if stormy" do
      stormy_weather_error = "Stormy weather! Not safe to fly."
      condition = Weather.new
      allow_any_instance_of(Weather).to receive(:forecast).and_return(:stormy)
      subject.land(:plane)
      subject.weather_conditions(condition)
      expect{subject.take_off(:plane)}.to raise_error(stormy_weather_error)
    end
  end

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "doesn't permit nil capacity" do
      subject { Airport.new(nil) }
      expect { Airport.new(nil) }.to raise_error "Capacity of nil not allowed."
    end
  end
end
