class CreateLiveLessonSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :live_lesson_schedules do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
