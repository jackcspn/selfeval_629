class AddTypeAndExplanationToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :qtype, :string
    add_column :questions, :explanation, :string
  end
end
