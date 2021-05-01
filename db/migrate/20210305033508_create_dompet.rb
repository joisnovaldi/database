class CreateDompet < ActiveRecord::Migration[5.2]
  def change
    create_table :dompets do |t|
      t.integer :balance
      t.integer :user_id
    end
  end
end
