require 'airport'

RSpec.describe Airport do

  it { is_expected.to respond_to :plane_landed }

  describe "#plane_landed" do
    it 'lets plane land at airport' do
      plane = Plane.new
      subject.plane_landed(plane)
      expect(plane.plane_landed).to eq plane
    end
  end

  it 'lets plane take off from airport' do
  end

  describe '#plane_landed' do
    it "doesn't allow more planes than capacity" do
      30.times do
        subject.plane_landed(Plane.new)
      end
        expect { subject.plane_landed(Plane.new) }.to raise_error("The airport is full")
    end
  end

end
