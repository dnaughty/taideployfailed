json.extract! student, :id, :lastname, :firstname, :middlename, :dob, :street, :city, :zip, :pronouns, :gender, :school_id, :created_at, :updated_at
json.url student_url(student, format: :json)
