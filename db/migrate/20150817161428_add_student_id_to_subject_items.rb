class AddStudentIdToSubjectItems < ActiveRecord::Migration
  def change
    add_column :subject_items, :student_id, :integer
  end
end
