import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("zzzzz")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#message-container').append (data.mod_message)
  }
});
