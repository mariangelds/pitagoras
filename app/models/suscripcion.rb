class Suscripcion < ActiveRecord::Base
has_no_table

	column :nombre, :string
	column :apellido, :string
	column :cedula, :string
	column :materia, :string
	column :email, :string

	validates_presence_of :nombre, message: "El nombre no puede estar en blanco"
	validates_presence_of :apellido, message: "El apellido no puede estar en blanco"
	validates_presence_of :cedula, message: "La cédula no puede estar en blanco"
	validates_presence_of :materia, message: "La materia no puede estar en blanco"
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	def suscribete_base
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_BASE'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Suscrito  #{self.email} a MailChimp") if result end


    def suscribete_desarrollo
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_DESARROLLO'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Suscrito  #{self.email} a MailChimp") if result end

    def suscribete_ruby
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_RUBY'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Suscrito  #{self.email} a MailChimp") if result end


end