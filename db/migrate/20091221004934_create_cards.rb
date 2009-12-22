class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :class_idx
      t.integer :question_idx
      t.timestamps
    end
    create_table :card_translations do |t|
      t.string :locale
      t.references :card
      t.text :question
      t.text :answer
      t.timestamps
     end
  end
  
  def self.down
    drop_table :cards
    drop_table :card_translations
  end
end
