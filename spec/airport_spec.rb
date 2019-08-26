require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it "create instance" do
    is_expected.to respond_to(:land).with(1).argument
    is_expected.to respond_to(:take_off).with(1).argument
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    let(:plane_mock) { double :plane }
    let(:weather_mock) { double :weather }

    # Change the subject for "land" scope to pass the mock instead
    # the default weather
    subject { Airport.new(:weather => weather_mock) }

    it 'when is not stormy' do
      allow(weather_mock).to receive(:stormy) { false }
      expect { subject.land(plane_mock) }.not_to raise_error
    end

    it 'when is stormy' do
      allow(weather_mock).to receive(:stormy) { true }
      # Since the function "land" will raise an error, it is needed to be
      # called in a block
      expect {
        subject.land(plane_mock)
      }.to raise_error Airport::ERROR_TO_WEATHER_CONDITION
    end

    it "when is full" do
      overflow = Airport::DEFAULT_CAPACITY + 1
      allow(weather_mock).to receive(:stormy) { false }
      expect {
        (overflow).times do
          subject.land(:plane_mock)
        end
      }.to raise_error Airport::ERROR_AIRPORT_FULL
    end

    it "when is full and stormy" do
      overflow = Airport::DEFAULT_CAPACITY + 1
      allow(weather_mock).to receive(:stormy) { true }
      expect {
        (overflow).times do
          subject.land(:plane_mock)
        end
      }.to raise_error Airport::ERROR_TO_WEATHER_CONDITION
    end

  end

  describe '#take off' do

    let(:plane_mock) { double :plane }
    let(:weather_mock) { double :weather }

    subject { Airport.new(:weather => weather_mock) }

    it "when is not stormy and landed" do
      allow(weather_mock).to receive(:stormy) { false }
      subject.land(plane_mock)
      expect{ subject.take_off(plane_mock) }.not_to raise_error
    end

    it 'when is not stormy and not landed' do
      allow(weather_mock).to receive(:stormy) { false }
      expect{
        subject.take_off(plane_mock)
      }.to raise_error Airport::ERROR_PLANE_NOT_FOUND
    end

    it "when is stormy and landed" do
      allow(weather_mock).to receive(:stormy) { false }
      subject.land(plane_mock)
      allow(weather_mock).to receive(:stormy) { true }
      expect {
        subject.take_off(plane_mock)
      }.to raise_error Airport::ERROR_TO_WEATHER_CONDITION
    end
  end

  describe '#landed' do

    let(:plane_mock) { double :plane }
    let(:weather_mock) { double :weather }

    subject { Airport.new(:weather => weather_mock) }

    it "when is landed" do
      allow(weather_mock).to receive(:stormy) { false }
      subject.land(plane_mock)
      expect(subject.landed(plane_mock)).to eq true
    end

    it "when is not landed" do
      expect(subject.landed(plane_mock)).to eq false
    end


  end
end
