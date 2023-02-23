class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.string :type
      t.string :setup
      t.string :punchline

      t.timestamps
    end
  end
end
