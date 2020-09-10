class FixCreatedAtName < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :updatet_at, :updated_at
  end
end
