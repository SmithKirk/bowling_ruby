require 'frame'

describe 'Frame' do

  subject(:frame){Frame.new}

  describe 'initialize' do
    xit 'with no score' do
      expect(frame.frame_score).to eq {}
    end

    it 'with 10 pins' do
      expect(frame.pins).to eq 10
    end


  end

  describe '#bowl' do
    it 'records score' do
      frame.bowl(1,6)
      expect(frame.frame_score[:'1']).to eq 6
    end

    it 'pins_down are taken away from pins' do
      frame.bowl(1,6)
      expect(frame.pins).to eq 4
    end


  end

end
