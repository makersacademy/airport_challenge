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

    it 'should confirm with plane that it has landed' do
      plane = double(:plane, :docked => true, :has_landed? => true)
      expect(plane).to receive(:has_landed?)
      subject.dock_plane(plane)
    end
  end

end
