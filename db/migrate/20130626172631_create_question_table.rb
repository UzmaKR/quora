class CreateQuestionTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :qt
      t.references :user

      t.timestamps
    end
  end
end
