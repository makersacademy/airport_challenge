require "airport"

describe Airport do

  let(:plane) { double("A plane") }

  # context "#initialize" do
  #
  #   it "should have a default capacity" do
  #     subject { Airport.new }
  #     allow(subject).to receive(:stormy?).and_return false
  #     Airport::DEFAULT_CAPACITY.times do
  #       subject.land(plane)
  #     end
  #
  #    expect{ subject.land(plane) }.to raise_error "Airport is full"
  #   end
  # end

  context "#land" do

    it "lands a plane" do
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.hangar).to include plane
    end

    it "Cannot land in stormy weather" do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error("Cannot land in stormy weather")
    end

    it "Cannot land a plane when the airport is full" do
      Airport::DEFAULT_CAPACITY.times do
        allow(subject).to receive(:stormy?).and_return false
        subject.land(plane)
      end

      expect { subject.land(plane) }.to raise_error "Airport is full"
    end

  end

  context "#take_off" do

    before(:each) do
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
    end

    it "removes plane from the airport after take_off" do
      subject.take_off(plane)
      expect(subject.hangar).to eq([])
    end

    it "Cannot take_off in stormy weather" do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error("Cannot take off in stormy weather")
    end

  end

end
