class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      # assciation
      t.integer :user_id, null: false

      # common
      t.integer :battle_id, null: false
      t.boolean :win, null: false
      t.integer :gachi_power, null: false, default: 0

      # counts
      t.integer :assist, null: false
      t.integer :death, null: false
      t.integer :kill, null: false
      t.integer :paint, null: false
      t.integer :special, null: false

      # time
      t.integer :start_at, null: false # unix time

      # rule
      t.string :rule_name, null: false

      # stage
      t.integer :stage_id, null: false # スプラトゥーン内の全ステージのidが分からないのでレコードで持つ
      t.string :stage_name, null: false

      # weapon
      t.integer :weapon_id, null: false # スプラトゥーン内の全武器のidが分からないのでレコードで持つ
      t.string :weapon_name, null: false

      t.timestamps
    end

    add_index :records, :user_id

    add_index :records, :weapon_id
    add_index :records, :weapon_name

    add_index :records, :stage_id
    add_index :records, :stage_name

    add_index :records, :rule_name

    add_index :records, :battle_id, unique: true
  end
end
