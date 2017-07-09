require 'weather'

describe Weather do

  subject { Object.new.extend(Weather) }

  describe "#stormy?" do
    it 'should give a value of true or false' do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end
  end

end
