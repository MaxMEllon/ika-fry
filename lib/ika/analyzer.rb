module IkaFry
  class Analizer
    class << self
      # @param Record::ActiveRecord_Associations_CollectionProxy<Record> records
      def analyse_by_rule records
        grouped = records.group_by { |r| r.rule_name }
        inital = { battle: 0, win: 0, kill: 0, death: 0, assist: 0 }
        grouped.map do |k, v|
          ComposedResult.new(v.inject(inital) do |memo, r|
            {
              name: k,
              battle: memo[:battle] + 1,
              win: memo[:win] + (r.win ? 1 : 0),
              kill: memo[:kill] + r.kill,
              death: memo[:death] + r.death,
              assist: memo[:assist] + r.assist,
            }
          end)
        end
      end
    end
  end
end
