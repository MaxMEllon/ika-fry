class Record < ApplicationRecord
  belongs_to :user

  RULES = {
    splat_zones: 'ガチエリア',
    rainmaker: 'ガチホコバトル',
    tower_control: 'ガチホコ',
    clam_blitz: 'ガチアサリ',
    turf_war: 'ナワバリバトル',
  }.freeze

  def kd
    kill / (death + 0.0)
  rescue => _
    Float::INFINITY
  end

  def kad
    (kill + assist) / (death + 0.0)
  rescue => _
    Float::INFINITY
  end

  RULES.map do |k, _|
    define_singleton_method("#{k}_graphy") do
      records = Record.where(rule_name: k)
      LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: RULES[k])
        f.yAxis [
          { title: { text: 'ガチパワー' } },
          { title: { text: 'K/D' }, opposite: true },
        ]
        f.series(name: 'ガチパワー', yAxis: 0, data: records.map(&:gachi_power) )
        f.series(name: 'k/d', yAxis: 1, data: records.map(&:kd) )
      end
    end
  end
end
