class AddDisplayToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :display, :boolean
  end
end
