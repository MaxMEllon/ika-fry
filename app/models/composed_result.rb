class ComposedResult
  include ActiveModel::Model

  attr_accessor :name, :battle, :win, :kill, :death, :assist, :gachi_power

  def win_rate
    "#{((win / (battle + 0.0)) * 100).round(2)}%"
  end

  def kd
    (kill / (death + 0.0)).round(2)
  rescue => _
    Float::INFINITY
  end

  def kad
    ((kill + assist) / (death + 0.0)).round(2)
  rescue => _
    Float::INFINITY
  end
end
