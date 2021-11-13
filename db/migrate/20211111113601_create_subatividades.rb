class CreateSubatividades < ActiveRecord::Migration[6.1]
  def change
    create_table :subatividades do |t|
      t.string :nome
      t.references :atividade
      t.boolean :completa, default: false
      t.timestamps
    end
  end
end
