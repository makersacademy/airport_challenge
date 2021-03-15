require 'airport'

describe 'Airport' do

  describe 'attributes' do

    subject { Airport.new }
    it "allows reading and writing for :name" do
      subject.name = 'Gatwick'
      expect(subject.name).to eq('Gatwick')
    end

    it "allows reading and writing for :terminal" do
      subject.terminal = 2
      expect(subject.terminal).to eq(2)
    end

    it "allows reading and writing for :hanger" do
      subject.hanger = 1
      expect(subject.hanger).to eq(1)
    end

    it "allows reading and writing for :runway" do
      subject.runway = 1
      expect(subject.runway).to eq(1)
    end

  end

end
