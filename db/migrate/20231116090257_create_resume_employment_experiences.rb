class CreateResumeEmploymentExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_employment_experiences do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :employment_experience, null: false, foreign_key: true

      t.timestamps
    end

    # avoid duplicates rows by adding index

    add_index :resume_employment_experiences,
              %i[resume_id employment_experience_id],
              unique: true,
              name: 'index_experiences_on_resume'
  end
end
