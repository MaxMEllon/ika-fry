class ComposedResult
  include ActiveModel::Model

  attr_accessor :name, :battle, :win, :kill, :death, :assist, :gachi_power

  def graphy
  end
end
