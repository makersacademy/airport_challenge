require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  context 'When it is sunny' do

    describe '#land' do

      before(:each) { subject.land(plane) }

      it "stores the plane in the airport" do
        expect(subject.planes).to include plane
      end

      it "raises an error if plane has already landed" do
        expect { subject.land(plane) }.to raise_error "Plane has already landed"
      end

    end

    describe '#take_off' do

      it "releases a plane from the airport" do
        another_plane = Plane.new
        subject.land(plane)
        subject.land(another_plane)
        expect(subject.take_off(plane)).to eq plane
      end

      it "no longer stores plane in the airport" do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it "raises an error if airport is empty" do
        expect { subject.take_off(plane) }.to raise_error "No planes available"
      end

    end

  end

  context 'When it is stormy' do


  end

end
