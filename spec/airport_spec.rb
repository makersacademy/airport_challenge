require 'airport'
DEFAULT_CAPACITY = 20
describe Airport do
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to(:land).with(1).argument }
  #mocking behaviour of the double
  #we use the plane.new very often so we store it with a let statement
  let(:plane) { double :plane }
  describe '#land' do
    it "lands a plane" do
      plane = double(:plane)
      expect(subject.land(plane)).to eq [plane]
    end
    it "should not let plane land if airport is full" do
      subject.capacity.times { subject.land plane }
      expect { subject.land plane }.to raise_error ("Airport is full. The plane cannot land")
    end
    it "should not let plane land if the weather is stormy" do
      weather = double(:weather, stormy?: true)
      expect { subject.land plane }.to raise_error ("The plane cannot land due to bad weather conditions")
    end
  end

  describe '#take_off' do
    it "the airport should let planes take off" do
      subject.land plane
      expect(subject.take_off).to be plane
    end
      # it "should not release infinite planes" do
      #   expect{ subject.take_off }.to raise_error ("There are no planes in the airport")
      # end
    it "should not let plane fly if the weather is stormy" do
      weather = double(:weather, stormy?: true)
      expect{ subject.take_off }.to raise_error ('The plane cannot fly due to bad weather conditions')
    end
  end

end
