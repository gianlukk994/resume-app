class CreateEmploymentExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_experiences do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
