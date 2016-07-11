require 'airport'

describe Airport do

  describe 'land plane' do
    subject(:airport) {described_class.new}
    let(:plane) {double :plane}

    it 'can land planes' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed).and_return false
      allow(plane).to receive(:landed=).with(true)
      subject.land(plane)
    end

    it 'will not land planes when the weather is stormy' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return true
      allow(plane).to receive(:landed).and_return false
      allow(plane).to receive(:landed=).with(true)
      expect{subject.land(plane)}.to raise_error "Cannot land plane, weather is stormy"
    end

    it 'will not land planes when the airport is full' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed).and_return false
      allow(plane).to receive(:landed=).with(true)
      described_class::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "Cannot land plane, airport is full"
    end

  end

  describe 'launch plane' do
    subject(:airport) {described_class.new}
    let(:plane) {double :plane}

    it 'lets a plane takeoff if the weather is fine' do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed).and_return true
      allow(plane).to receive(:landed=).with(false)
      subject.takeoff(plane)
    end

    it "won't let a plane takeoff if the weather is stormy" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return true
      allow(plane).to receive(:landed).and_return true
      expect{subject.takeoff(plane)}.to raise_error "Plane cannot takeoff, weather is stormy"
    end

    it "won't let a plane takeoff if the plane is already in the air" do
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:landed).and_return false
      expect{subject.takeoff(plane)}.to raise_error "Plane cannot takeoff, plane is in the air"
    end
  end


end
