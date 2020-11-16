class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :method
      t.binary :params
      t.binary :response
      t.timestamps
    end
  end
end
