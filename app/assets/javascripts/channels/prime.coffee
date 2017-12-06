App.prime = App.cable.subscriptions.create "PrimeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    this.App.prime.updateReceived(data)
    # Called when there's incoming data on the websocket for this channel
