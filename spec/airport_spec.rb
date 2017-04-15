require 'airport'

describe Airport do

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock_plane).with(1).argument }

  describe '#dock_plane' do
    it 'tells plane to land' do
      plane = double(:plane, :land => true)
      expect(plane).to receive(:land)
      subject.dock_plane(plane)
    end

    it 'adds plane to Airport\'s @planes array' do
      plane = double(:plane, :land => true)
      subject.dock_plane(plane)
      expect(subject.planes).to include plane 
    end
  end

end
