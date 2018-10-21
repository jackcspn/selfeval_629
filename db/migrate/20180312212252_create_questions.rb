class CreateQuestions < ActiveRecord::Migration[5.1]
  def up
    create_table :questions do |t|
      t.string :content
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :answer  
    end
  end
  
  def down
    drop_table :questions
  end
end