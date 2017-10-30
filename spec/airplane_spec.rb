require 'airplane.rb'

describe Airplane do
  subject { Airplane.new }

  context 'Checking if the plane flies' do
    it 'Checks if the plane is Flying' do
      expect(subject.flying?).to eq true
    end

    it 'Checks if the plane is Landed' do
      expect(Airplane.new(true).flying?).to eq false
    end

  end

end
