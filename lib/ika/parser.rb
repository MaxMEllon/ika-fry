module IkaFry
  class IkaParseError < RuntimeError; end

  class Parser
    class << self
      def parse json
        _parse json
      rescue => e
        raise IkaParseError, "Unexpected format of json #{e}"
      end

      private

      def _parse json
        hash = JSON.parse json
        hash['results'].map do |r|
          {
            win: r['my_team_result']['key'] == 'victory',
            battle_id: r['battle_number'].to_i,
            gachi_power: r['estimate_gachi_power'] || 0,

            assist: r['player_result']['assist_count'],
            death: r['player_result']['death_count'],
            kill: r['player_result']['kill_count'],
            special: r['player_result']['special_count'],
            paint: r['player_result']['game_paint_point'],

            start_at: r['start_time'],

            rule_name: r['rule']['key'],

            stage_id: r['stage']['id'].to_i,
            stage_name: r['stage']['name'],

            weapon_id: r['player_result']['player']['weapon']['id'].to_i,
            weapon_name: r['player_result']['player']['weapon']['name'],
          }
        end
      end
    end
  end
end
