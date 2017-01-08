require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  describe 'Airport' do
    it { should respond_to(:take_off) }
    it { should respond_to(:planes) }
  end

=begin
  describe '#take_off' do
    it 'takes off planes' do
      plane = subject.take_off
      expect(plane).to be_departed
    end
  end
=end

  describe '#land' do
    it {should respond_to(:land).with(1).argument}
    it 'has the plane after landing' do
      allow(plane).to receive(:land)
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it 'confirms plane landed' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.landed).to eq(true)
    end

  end

end
