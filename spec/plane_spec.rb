require 'plane'

describe Plane do

  describe '#status method' do
    it "should respond to #status" do
      expect(subject).to respond_to(:status)
    end

  end

  describe '#land method' do
    it 'should respond to #land' do
      expect(subject).to respond_to(:land)
    end

    it 'should change #status to "at_airport" after landing' do
      expect { subject.land }.to change { subject.status }
      expect(subject.status).to eq("at_airport")
    end

    it "should record airport_id when it lands"
  end

  describe '#takeoff method' do
    it 'should respond to #takeoff' do
      expect(subject).to respond_to(:takeoff)
    end

    it 'should change #status to "in_flight" after takeoff' do
      expect { subject.takeoff }.to change { subject.status }
      expect(subject.status).to eq("in_flight")
    end

    it 'should only accept #takeoff from the same airport it is in'
  end
end
