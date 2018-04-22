require 'plane'

describe Plane do
 let(:airport) {double :airport_double, object_id: 979797977}
 let(:other_airport) {double :other_airport_double, object_id: 123456}

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
      expect { subject.land(airport.object_id) }.to change { subject.status }
      expect(subject.status).to eq("at_airport")
    end

    it "should record airport_id when it lands" do
      subject.land(airport.object_id)
      expect(subject.airport_id).to eq airport.object_id
    end

    it 'should raise an error when asked to land while #status is "at_airport"'
  end

  describe '#takeoff method' do

    before(:each) do
      subject.land(airport.object_id)
    end

    it 'should respond to #takeoff' do
      expect(subject).to respond_to(:takeoff)
    end

    it 'should change #status to "in_flight" after takeoff' do
      expect { subject.takeoff(airport.object_id) }.to change { subject.status }
    end

    it 'should set #status to "in_flight"' do
      subject.takeoff(airport.object_id)
      expect(subject.status).to eq("in_flight")
    end

    it 'should only accept #takeoff method from the same airport it is in' do
      expect {subject.takeoff(other_airport.object_id)}.to raise_error 'Instructions received from wrong airport'
    end

    it 'should return error when asked to takeoff while #status is "in_flight"' do
      subject.takeoff(airport.object_id)
      expect {subject.takeoff(airport.object_id)}
    end

    it 'should return #airport_id == nil while #status is "in_flight"' do
      subject.takeoff(airport.object_id)
      expect(subject.airport_id).to eq nil
    end
  end
end
