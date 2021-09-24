require 'system_designer'

describe SystemDesigner do
  describe "#defualt_capacity" do
    it 'should take in a number as a parameter and update the airport capacity' do
      expect(subject.default_capacity(20)).to eq 20
    end
  end

end
