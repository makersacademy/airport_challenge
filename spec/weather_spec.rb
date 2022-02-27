require 'weather'

describe Weather do
  it 'weather can respond to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  describe Weather do
    it 'randomises weather return stormy' do
      allow_any_instance_of(Object).to receive(:rand).and_return(9)
      weather = Weather.new
      expect(weather).to be_stormy
    end
  
    it 'randomises weather return sunny' do
      allow_any_instance_of(Object).to receive(:rand).and_return(2)
      weather = Weather.new
      expect(weather).to_not be_stormy
    end
  end

end
