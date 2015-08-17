class AddStudentIdToSubjectItemNotes < ActiveRecord::Migration
  def change
    add_column :subject_item_notes, :student_id, :integer
  end
end
