# frozen_string_literal: true

class CreateExtraAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :extra_attributes do |t|
      t.string :attribute_name
      t.string :attribute_value
      t.references :model, polymorphic: true

      t.timestamps
    end
  end
end
