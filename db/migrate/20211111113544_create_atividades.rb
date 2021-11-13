class CreateAtividades < ActiveRecord::Migration[6.1]
  def change
    create_table :atividades do |t|
      t.string :nome
      t.boolean :completa, default: false
      t.timestamps
    end
  end
end
