# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :project_alliance_id
      t.integer :user_id
      t.boolean :deletable, default: true
      t.timestamps
    end
  end
end
