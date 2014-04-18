class ChatController < WebsocketRails::BaseController
  include ActionView::Helpers::SanitizeHelper

  def initialize_session
    puts "Session Initialized\n"
  end

  def system_msg(ev, msg)
    broadcast_message ev, { 
      user_name: current_user.name, 
      received: Time.now.to_s(:short), 
      msg_body: msg[:msg_body]
    }
  end

  def new_message
  	# system_msg :new_message, message
  	puts "new message: #{message}" 
  end

  def client_connected
    # system_msg :new_message, "client #{client_id} connected"
    puts "client #{client_id} connected"
  end

  def delete_user
    # system_msg :new_message, "client #{client_id} disconnected"
    puts "client #{client_id} disconnected"
  end
end