class Doctor

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select { |appointment| appointment.doctor == self }
  end

  def patients
    appointments.map { |appointment| appointment.patient }
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end
  
end