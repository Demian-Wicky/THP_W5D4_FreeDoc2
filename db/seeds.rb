Doctor.delete_all
Patient.delete_all
Appointment.delete_all
# City.delete_all
# Specialty.delete_all
# JoinTableDoctorSpecialty.delete_all

# ############################################
# # NUMBERS

nb_doctor = 25
nb_patient = 150
nb_appointment = 30
# nb_city = 10
# nb_join_table_doctor_specialty = nb_doctor + 20

# ############################################
# # SPECIALTIES

specialties = ["Accident and emergency medicine","Allergology","Anaesthetics","Cardiology","Child psychiatry","Clinical biology","Clinical chemistry","Clinical microbiology","Clinical neurophysiology","Craniofacial surgery","Dermatology","Endocrinology","Family and General Medicine","Gastroenterologic surgery","Gastroenterology","General Practice","General surgery","Geriatrics","Hematology","Immunology","Infectious diseases","Internal medicine","Laboratory medicine","Nephrology","Neuropsychiatry","Neurology","Neurosurgery","Nuclear medicine","Obstetrics and gynaecology","Occupational medicine","Ophthalmology","Oral and maxillofacial surgery","Orthopaedics","Otorhinolaryngology","Paediatric surgery","Paediatrics","Pathology","Pharmacology","Physical medicine and rehabilitation","Plastic surgery","Podiatric surgery","Preventive medicine","Psychiatry","Public health","Radiation Oncology","Radiology","Respiratory medicine","Rheumatology","Stomatology","Thoracic surgery","Tropical medicine","Urology","Vascular surgery","Venereology"]
# specialties.each_with_index do |i, index|
#   Specialty.create!(
#     name: i
#   )
#   puts "Specialty n°#{index+1} created!"
# end

############################################
# CITIES

# nb_city.times do |i|
#   City.create!(
#     name: Faker::Address.city,
#   )
#   puts "City n°#{i+1} created!"
# end

############################################
# DOCTORS

nb_doctor.times do |i|
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    # city_id: City.all.shuffle.last.id,
    specialty: specialties.sample
  )
  # puts "Doctor n°#{i+1} created!"
end
puts "Doctors created!"

############################################
# PATIENT

nb_patient.times do |i|
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # city_id: City.all.shuffle.last.id,
  )
  # puts "Patient n°#{i+1} created!"
end
puts "Patients created!"

############################################
# APPOINTMENTS

nb_appointment.times do |i|
  doctor = Doctor.all.shuffle.last
  Appointment.create!(
    date: Faker::Time.between_dates(from: Date.today, to: Date.today + 365, period: :day),
    doctor_id: doctor.id,
    patient_id: Patient.all.shuffle.last.id,
    # city_id: doctor.city_id,
  )
  # puts "Apointment n°#{i+1} scheduled!"
end

puts "Appointments scheduled!"

# ############################################
# # JOINTABLE DOCTORS-SPECIALTIES

# doctors = Doctor.all # array of all doctors
# doctors.each_with_index do |doctor, index| # each doctor will have one or more specialties
  
#   random_nb = rand(1..5) # this doctor will have random_nb specialties
#   mixed_specialties = Specialty.all.shuffle
  
#   i = 0
#   random_nb.times do |i|
#     JoinTableDoctorSpecialty.create!(
#       doctor_id: doctor.id,
#       specialty_id: mixed_specialties[i].id,
#     )
#     i += 1
#   end

#   if random_nb == 1
#     puts "Doctor n°#{index+1} got #{random_nb} random specialty!"
#   else
#     puts "Doctor n°#{index+1} got #{random_nb} random and different specialties!"
#   end
# end

# ############################################

puts "Hooray! Seeding done 👌"