class AddApprovedToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :approved, :string
  end
end
