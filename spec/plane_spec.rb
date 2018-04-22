require 'plane'

describe Plane do

  let(:airport) { double :airport_double, object_id: 979_797_977 }
  let(:other_airport) { double :other_airport_double, object_id: 123_456 }

  describe '#land method' do
    before(:each) do
      subject.land(airport.object_id)
    end

    it "should record airport_id when it lands" do
      expect(subject.airport_id).to eq airport.object_id
    end

    it 'should raise an error when asked to land while at the airport' do
      expect { subject.land(airport.object_id) }.to raise_error 'Cannot land while at the airport'
    end
  end

  describe '#takeoff method' do
    before(:each) do
      subject.land(airport.object_id)
    end

    it 'should clear airport_id on takeoff' do
      subject.takeoff(airport.object_id)
      expect(subject.airport_id).to eq nil
    end

    it 'should report that it left the airport' do
      expect(subject.takeoff(airport.object_id)).to eq "Left airport #{airport.object_id}"
    end

    it 'should only accept #takeoff method from the same airport it is in' do
      expect { subject.takeoff(other_airport.object_id) }.to raise_error 'Instructions received from wrong airport'
    end

    it 'should return error when asked to takeoff while in flight' do
      subject.takeoff(airport.object_id)
      expect { subject.takeoff(airport.object_id) }.to raise_error 'Cannot takeoff while in flight'
    end
  end
end
