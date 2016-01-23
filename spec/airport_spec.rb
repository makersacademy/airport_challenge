require_relative '../lib/airport'

describe Airport do
  subject(:Airport) {described_class.new}

  let(:plane) {double :plane}

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  #LANDING
  describe "#land" do
    it "lands a plane and stores it in the array" do
      allow(subject).to receive(:weather_status).and_return(100)
      allow(plane).to receive(:landed).and_return("landed")
      allow(plane).to receive(:status).and_return("")
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "denies landing if there are more than 10 planes" do
      allow(subject).to receive(:weather_status).and_return(100)
      allow(plane).to receive(:landed).and_return("landed")
      allow(plane).to receive(:status).and_return("")
      11.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error("The airport is full")
    end

    it "denies landing if the weather is stormy" do
      allow(subject).to receive(:weather_status).and_return(10)
      expect {subject.land(plane)}.to raise_error("Can't land now, it's stormy!")
    end

  end

  #TAKEOFF
  describe "#takeoff" do
    it "takes off a plane and removes it from the array" do
      allow(subject).to receive(:weather_status).and_return(100)
      allow(plane).to receive(:landed).and_return("landed")
      allow(plane).to receive(:fly).and_return("flying")
      allow(plane).to receive(:status).and_return("")
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it "denies takeoff if the weather is stormy" do
      allow(subject).to receive(:weather_status).and_return(10)
      expect {subject.takeoff(plane)}.to raise_error("Can't take off now, it's stormy")
    end

  end


end
