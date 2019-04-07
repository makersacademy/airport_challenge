require 'planes'

describe Planes do
  describe '#landed' do
    it "shows the plane has landed" do
      expect(subject.landed?).to eq true
    end
  end
end
