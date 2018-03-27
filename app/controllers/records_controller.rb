require './lib/ika/parser'
require './lib/ika/analyzer'

class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = current_user.records
    @grouped_by_rule = IkaFry::Analizer.analyse_by_rule @records
    @splat_zones_graph = Record.splat_zones_graphy
    @rainmaker_graph = Record.rainmaker_graphy
    @tower_control_graph = Record.tower_control_graphy
    @clam_blitz_graph = Record.clam_blitz_graphy
    @turf_war_graph = Record.turf_war_graphy
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
