require_relative '../lib/airport'

describe Airport do
  let(:plane) {double(:plane)}

  describe 'initialization' do
    it 'defaults capacity of airport' do
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error 'Airport at full capacity.'
    end
  end

  describe "#take_off" do
    it "takes one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "takes off a plane at the airport" do
      expect{ subject.take_off(plane) }.not_to raise_error
    end

  end 

  describe "#land" do
    it "takes one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands a plane at the airport" do
      expect{ subject.land(plane) }.not_to raise_error
    end
  end 

end
