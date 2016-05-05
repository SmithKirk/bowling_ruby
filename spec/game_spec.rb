require 'game'
describe 'Game' do

  subject(:game){Game.new}
  let(:frame){Frame.new}

  describe 'initialize' do
    it 'with frame attribute' do
      expect(game.frames).to eq []
    end

    it 'with score of 0' do
      expect(game.game_total).to eq 0
    end

    it 'with bonus set to nil' do
      expect(game.bonus).to eq nil
    end
  end

  describe '#new_frame' do
    it 'frame is an instance of Frame' do
      game.new_frame
      expect(game.frame).to be_a Frame
    end
  end

  describe '#bowl' do
    it '1st bowl and score stored' do
      game.bowl(1,5)
      expect(game.frame.frame_score).to include(:"1"=>5 )
    end

    it '2nd bowl is added to score' do
      game.bowl(1,5)
      game.bowl(2,4)
      expect(game.frame.frame_score).to include(:"1"=>5, :"2"=>4 )
    end

    it 'score is collated from current frame' do
      game.bowl(1,5)
      game.bowl(2,4)
      expect(game.frame_total).to eq 9
    end

  end

  describe '#close_frame' do
    it 'adds current frame to frames array' do
      game.bowl(1,5)
      game.bowl(2,4)
      game.close_frame
      expect(game.frames).to include({:"1"=>5, :"2"=>4} )
    end

    context 'strike' do
      it '10 pins on bowl 1 give a strike' do
        game.bowl(1,10)
        game.close_frame
        expect(game.bonus).to eq 'strike'
      end
    end

    context 'half strike' do
      it 'frame score of 10 gives a half strike' do
        game.bowl(1,8)
        game.bowl(2,2)
        game.close_frame
        expect(game.bonus).to eq 'half strike'
      end
    end

    context 'if no strike' do
      it 'bonus is set to nil' do
        # allow(game).to receive(:bonus) {'strike'}
        game.bowl(1,10)
        game.close_frame
        game.bowl(1,5)
        game.bowl(2,4)
        game.close_frame
        expect(game.bonus).to eq nil
      end

      it 'game score is updated' do
        game.bowl(1,5)
        game.bowl(2,4)
        game.close_frame
        expect(game.game_total).to eq 9
      end
    end

  end

end
