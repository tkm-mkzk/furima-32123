class CreateShippingSources < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_sources do |t|

      t.timestamps
    end
  end
end
