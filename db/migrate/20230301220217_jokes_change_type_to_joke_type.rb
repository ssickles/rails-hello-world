class JokesChangeTypeToJokeType2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :jokes, :type, :joke_type
  end
end
