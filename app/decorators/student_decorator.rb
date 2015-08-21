class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def birth_date
    "#{birthdate}"
  end

  def avg_notes(subject_item)
    average = SubjectItemNote.where(subject_item_id: subject_item.id).average(:value)
    average.nil? ? '0.00' : "%.2f" % average
  end
end
