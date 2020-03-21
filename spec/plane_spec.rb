require 'plane'

describe Plane do

  context '#lands' do
    it 'responds' do
      expect(subject).to respond_to :lands
    end
    it 'updates @flying to false' do
      subject.lands
      expect(subject).to_not be_flying
    end
  end
end
