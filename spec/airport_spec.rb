require 'airport'

class PlaneDouble

end

describe Airport do

  describe '#land' do
    it { should respond_to(:land).with(1).argument }

    it 'stores the plane that landed' do
      plane = PlaneDouble.new
      subject.land(plane)
      expect(subject.has_plane?(plane)).to eq true
    end

  end
end