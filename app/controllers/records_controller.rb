require './lib/ika/parser'

class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    json = params[:json].read
    data = IkaFry::Parser.parse json
    selected_data = data.select { |d| Record.find_by(battle_id: d[:battle_id]) == nil }
    selected_data.each do |d|
      Record.create(d.merge(user_id: current_user.id))
    end
  end
end
