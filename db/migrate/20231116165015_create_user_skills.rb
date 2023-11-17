#  frozen_string_literal: true

class CreateUserSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :user_skills do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # avoid duplicates rows by adding index

    add_index :user_skills,
              %i[skill_id user_id],
              unique: true
  end
end
