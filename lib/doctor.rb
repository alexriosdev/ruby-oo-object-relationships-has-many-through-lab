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
    appointment = Appointment.new(date, patient, self)
    Appointment.all << appointment
    appointment
  end
  
end