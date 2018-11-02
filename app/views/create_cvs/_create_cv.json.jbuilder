json.extract! create_cv, :id, :id_number, :passport_number, :identification_type, :gender, :date_of_birth, :place_of_birth, :disability, :education_type, :created_at, :updated_at
json.url create_cv_url(create_cv, format: :json)
