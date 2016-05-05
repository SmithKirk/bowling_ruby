require_relative 'frame'

class Game

  attr_reader :frames, :game_total, :frame, :frame_total, :bonus
  attr_writer :frames, :game_total, :frame, :frame_total, :bonus

  def initialize
    @frames = []
    @game_total = 0
    @frame = Frame.new
    @bonus = nil
    @frame_total = nil
  end

  def new_frame
    @frame = Frame.new
  end

  def bowl(ball, pins_down)
    ball_and_pins_down(ball, pins_down)
    sum_frame
  end

  def close_frame
    frame_total_add_to_game_total
    @frames.push(@frame.frame_score)
    if strike?
    else half_strike?
    end
    new_frame
  end

  private
  def frame_total_add_to_game_total
    @game_total += @frame_total
  end

  def ball_and_pins_down(ball, pins_down)
    @frame.bowl(ball, pins_down)
  end

  def sum_frame
    @frame_total = frame.frame_score.values.inject{|a,b| a+b}
  end

  def strike?
    if @frame.frame_score[:'1'] == 10
      @bonus = 'strike'
    end
  end

  def half_strike?
    frame_total == 10 ? @bonus = 'half strike' : @bonus = nil
  end

  # def no_bonus
  #   if frame_total < 10
  #     @bonus = nil
  #   end
  # end

end
