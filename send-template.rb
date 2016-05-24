require 'mandrill'
require 'dotenv'
require 'date'

Dotenv.load

begin
  mandrill = Mandrill::API.new ENV['API_KEY']
  template_name = 'Foo'
  template_content = []
  message = {
    to: [{
      type: 'to',
      email: 'john@example.com',
      name: 'John Doe'
    }],
    subject: "Ah Meng World Registration Confirmation",
    global_merge_vars: [{name: 'first_name', content: 'John'}]
  }
  result = mandrill.messages.send_template template_name, template_content, message
rescue Mandrill::Error => e
  puts "A mandrill error occurred: #{e.class} - #{e.message}"
  raise
end
