class AddTopicToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :topic, :string
  end
end
