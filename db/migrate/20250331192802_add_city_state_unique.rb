# frozen_string_literal: true

class AddCityStateUnique < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_index :locations, %i[city state], unique: true, algorithm: :concurrently
  end
end
