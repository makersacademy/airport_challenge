require 'airport'

describe Airport do
# let(:weather) { Mockweather.new }
  describe '#land' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land).with(1).argument }
    let(:plane) { Plane.new }
    it 'raises an error when airport is full' do
      described_class::AIRPORT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error(RuntimeError)
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
    it 'raises an error when there are no planes available' do
      expect { subject.take_off }.to raise_error(RuntimeError)
    end
  end
  # describe "it's stormy u can't land" do
  #   let(:weather) { Mockweather.new }
  #   allow(weather).to receive(:stormy?).and_return true
  #   message = "it's stormy u can't land"
  #   expect { airport.land(plane) }.to raise_error(RuntimeError)
  # end
  #
  # describe "the plane can land there's no storm" do
  #   let(:weather) { Mockweather.new }
  #   allow(weather).to receive(:stormy?).and_return false
  #   message = "the storm has cleared u can land"
  #   expect { airport.land(plane) }.not_to raise_error(RuntimeError)
  # end

  describe "airport capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
    end
  end

end
