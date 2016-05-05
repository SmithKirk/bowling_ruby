class Frame

  attr_reader :pins, :bowl
  attr_accessor :frame_score

  def initialize
    @pins = 10
    @frame_score = {}
  end

  def bowl(ball, pins_down)
    @frame_score[ball.to_s.to_sym] = pins_down
    @pins -= pins_down
  end

end
