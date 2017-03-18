require 'weather'

describe Weather do

  describe 'initialization' do
    subject { Weather.new }

    it 'sets stormy to false' do
    expect(subject.stormy).to eq false
    end
  end

end
