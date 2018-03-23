require 'airport'

describe Airport do

  it 'exists as a class' do
    expect(Airport).to be_instance_of Class
  end

  describe '#land'
    it 'should have a land method' do
      expect(subject).to respond_to(:land)
    end

    it 'should take a plane in the land method argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

end
