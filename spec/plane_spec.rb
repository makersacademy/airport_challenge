require "plane.rb"

describe Plane do
    it { is_expected.to respond_to :id }
    it 'sets the id when initialized with one' do
        p = Plane.new(1234)
        expect(p.id).to eq("1234")
    end
end