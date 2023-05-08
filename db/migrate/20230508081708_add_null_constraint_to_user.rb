# frozen_string_literal: true

# Adding null constraint to user
class AddNullConstraintToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, false
  end
end
