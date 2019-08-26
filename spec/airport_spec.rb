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
      }.to raise_error Airport::ERROR_LAND_WEATHER_CONDITION
    end

    it "when is full" do
      overflow = Airport::DEFAULT_CAPACITY + 1
      allow(weather_mock).to receive(:stormy) { false }
      expect {
        (overflow).times do
          subject.land(:plane_mock)
        end
      }.to raise_error Airport::FULL_ERROR
    end

    it "when is full and stormy" do
      overflow = Airport::DEFAULT_CAPACITY + 1
      allow(weather_mock).to receive(:stormy) { true }
      expect {
        (overflow).times do
          subject.land(:plane_mock)
        end
      }.to raise_error Airport::ERROR_LAND_WEATHER_CONDITION
    end

  end

  #
  # describe 'take off' do
  #   it "Should allow a plane to take off" do
  #     plane = Plane.new
  #     airport = Airport.new
  #     expect(airport.take_off(plane)).to eq "Plane Already taked off"
  #   end
  #
  #   it 'raises error when try to take off and weather is stormy' do
  #     plane = Plane.new
  #     airport = Airport.new
  #     allow(airport).to receive(:stormy) { true }
  #     expect { airport.take_off(plane) }.to raise_error "Stormy weather"
  #   end
  # end

end
