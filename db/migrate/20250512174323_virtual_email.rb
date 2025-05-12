class VirtualEmail < ActiveRecord::Migration[7.1]
  def change
    create_table 'temp.customers' do |t|
      t.string :email
      t.virtual :downcased_email, type: :string, as: 'LOWER(email)', stored: true
    end
  end
end
