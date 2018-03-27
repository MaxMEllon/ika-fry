class Record < ApplicationRecord
  belongs_to :user

  RULES = {
    turf_war: 'ガチホコバトル',
    splat_zones: 'ガチエリア',
    clam_blitz: 'ガチアサリ',
    tower_control: 'ガチホコ',
  }.freeze

  def kd
    p kill / (death + 0.0)
    kill / (death + 0.0)
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
        f.series(name: 'ガチパワー', yAxis: 0, data: records.map { |r| r.gachi_power } )
        f.series(name: 'k/d', yAxis: 1, data: records.map { |r| r.kd } )
      end
    end
  end
end
