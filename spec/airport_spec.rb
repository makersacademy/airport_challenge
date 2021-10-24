require_relative '../lib/airport'

describe Airport do

  describe '#land' do
    it 'instructs a plane to land at an airport' do
      plane = Plane.new

      expect(subject.land(plane)).to eq plane
      end

    it {is_expected.to respond_to :land}
  end
end


=begin

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end
    it 'confirms it is no longer in the airport' do
      expect (subject.take_off(plane)).should_receive(:plane), "The plane is no longer at the airport"
    end
  end
  it { is_expected.to respond_to :take_off }




end
=end
