# frozen_string_literal: true

class CreateResumeSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_skills do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end

    # avoid duplicates rows by adding index

    add_index :resume_skills,
              %i[skill_id resume_id],
              unique: true
  end
end
