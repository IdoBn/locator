jQuery ->
	dispatcher = new WebSocketRails('192.168.10.181:3000/websocket', true)

	dispatcher.on_open = (data) ->
		console.log "Connection has been established: #{data}"

	dispatcher.bind 'new_message', (message) ->
		console.log "new message: #{message.msg_body}, #{message.user_name}, #{message.received}"

	$('#check-in-button').click ->
		console.log 'button clicked'
		dispatcher.trigger('new_message', {msg_body: 'hello what is up!'})