require 'weather'

describe Weather do

  let(:plane) { double :plane}
  let(:airport) { double :airport, takeoff: [plane], planes: [plane, plane2] }

  describe '#is_stormy' do

    it 'should set weather to stormy' do
      expect(subject.is_stormy).to eq (true)
    end

  end

end
