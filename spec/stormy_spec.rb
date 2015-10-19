require 'stormy'

class Dummy;  include Stormy; end


describe Stormy do
    let(:stormy) {Dummy.new}
    let(:stormy1) {double :stormy}

    it 'is stormy' do
      stormy1 = double('stormy',stormy: true)
      expect(stormy1.stormy).to eq true
    end
  end
