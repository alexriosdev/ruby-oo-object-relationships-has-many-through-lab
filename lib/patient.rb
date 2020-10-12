class Patient

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
    Appointment.all.select { |appointment| appointment.patient == self }
  end

  def doctors
    appointments.map { |appointment| appointment.doctor }
  end

  def new_appointment(doctor, date)
    appointment = Appointment.new(date, self, doctor)
    Appointment.all << appointment
    appointment
  end

end