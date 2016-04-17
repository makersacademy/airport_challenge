require 'airport'

describe Airport do 

  let(:flying_plane) { double :plane, flying?: true }
  let(:landed_plane) { double :plane, flying?: false }

  describe 'launches planes' do 
    it 'responds to launch_plane' do 
      expect(subject).to respond_to :launch_plane
    end

    it 'launches a plane that flies' do 
      expect(flying_plane).to be_flying
    end
  end

  describe 'lands planes' do 
    it 'responds to land plane' do 
      expect(subject).to respond_to(:land).with(1).argument 
    end

    it 'lands a plane' do 
      expect(subject.land(flying_plane)).to eq [flying_plane] 
    end

    it 'responds to plane' do 
      expect(subject).to respond_to(:plane)
    end

    # it 'raises an error when the airport is full' do 
    #   subject.capacity.times { subject.land(flying_plane) }
    #   expect { subject.land(flying_plane) }.to raise_error('Airport full. Redirect to another airport.')
    # end

  end

end