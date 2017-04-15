require 'airport'

describe Airport do

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock_plane).with(1).argument }

  describe '#dock_plane' do
    it 'adds plane to Airport\'s @planes array' do
      plane = double(:plane, docked: true)
      subject.dock_plane(plane)
      expect(subject.planes).to include plane 
    end
  end

end
