class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :group
      t.belongs_to :inviter
      t.string :facebook_id
      t.timestamps
    end
    add_index :memberships, :group_id
  end
end
