class ChangeTypeCardKey < ActiveRecord::Migration[6.0]
  def change
    change_column :subscribers, :card_number, :string
  end
end
