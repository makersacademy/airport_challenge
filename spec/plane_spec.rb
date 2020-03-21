require 'plane'

describe Plane do

  context '#lands' do
    it 'responds' do
      expect(subject).to respond_to :lands
    end
    it 'updates flying? to false' do
      subject.lands
      expect(subject).to_not be_flying
    end
  end
  context '#takes_off' do
    it 'responds' do
      expect(subject).to respond_to :takes_off
    end
    it 'updates flying? to true' do
      subject.takes_off
      expect(subject).to be_flying
    end
  end
end
