class AddUidToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :uid, :integer
  end
end
