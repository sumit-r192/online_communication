# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, default: '', null: false
      t.integer :role, default: 0
      t.string :name
      t.integer :designation
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
