class AddFeedbackToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :feedback, :string
  end
end
