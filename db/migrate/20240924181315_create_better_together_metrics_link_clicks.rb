# frozen_string_literal: true

class CreateBetterTogetherMetricsLinkClicks < ActiveRecord::Migration[7.1] # rubocop:todo Style/Documentation
  def change
    create_bt_table :link_clicks, prefix: :better_together_metrics do |t|
      t.string :url, null: false
      t.string :page_url, null: false
      t.string :locale, null: false
      t.boolean :internal, default: true
      t.datetime :clicked_at, null: false
    end
  end
end
