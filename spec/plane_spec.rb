require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:land) }

  it 'should be initialised with a state of being at the airport' do
    expect(subject.instance_variable_get(:@at_airport)).to be true
  end

  context "airport is safe" do
    it 'when it is safe the plane can take off' do
      airport = object_double(Airport.new)
      allow(airport).to receive(:safe?).and_return(true)
      subject.take_off(airport)
      expect(subject).not_to be_at_airport
    end
  end

  context "airport is not safe" do
    it 'when it is not safe the plane cannot take off' do
      airport = object_double(Airport.new)
      allow(airport).to receive(:safe?).and_return(false)
      subject.take_off(airport)
      expect(subject).to be_at_airport
    end
  end

end