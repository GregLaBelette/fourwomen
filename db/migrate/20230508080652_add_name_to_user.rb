# frozen_string_literal: true

# Adding name to Users
class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :text
  end
end
