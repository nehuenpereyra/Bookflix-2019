class AddUrlPart < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :url_document, :string
  end
end
