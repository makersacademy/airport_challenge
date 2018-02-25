require 'weather'

describe Weather do

  describe ':generate' do

    it 'generates weather' do 
      expect(subject.generate).to eq("Stormy").or(eq("Sunny"))
    end

  end

end
