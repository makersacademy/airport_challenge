require_relative '../lib/airport'

describe Airport do
  subject(:Airport) {described_class.new}

  let(:plane) {double :plane}

  before do
    allow(subject).to receive(:weather_status).and_return("sunny")
    allow(plane).to receive(:landed).and_return("landed")
    allow(plane).to receive(:status).and_return("")
  end

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  #LANDING
  describe "#land" do
    it "lands a plane and stores it in the array" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "denies landing if there are more than 10 planes" do
      11.times {subject.land(plane)}
      error = "The airport is full"
      expect {subject.land(plane)}.to raise_error(error)
    end

    it "denies landing if the weather is stormy" do
      allow(subject).to receive(:weather_status).and_return("stormy")
      error = "Can't land, it's stormy!"
      expect {subject.land(plane)}.to raise_error(error)
    end

    it "can't land the same plane twice" do
      allow(plane).to receive(:status).and_return("landed")
      error = "This plane has already been landed"
      expect {subject.land(plane)}.to raise_error(error)
    end

  end

  #TAKEOFF
  describe "#takeoff" do
    it "takes off a plane and removes it from the array" do
      allow(plane).to receive(:fly).and_return("flying")
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it "denies takeoff if the weather is stormy" do
      allow(subject).to receive(:weather_status).and_return("stormy")
      error = "Can't takeoff, it's stormy!"
      expect {subject.takeoff(plane)}.to raise_error(error)
    end

    it "can't take off the same plane twice" do
      allow(plane).to receive(:status).and_return("flying")
      error = "This plane is already flying"
      expect {subject.takeoff(plane)}.to raise_error(error)
    end

  end


end
