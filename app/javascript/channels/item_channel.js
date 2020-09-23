import consumer from "./consumer"

consumer.subscriptions.create("ItemChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<p>${data.content.name}</p>`;
    const messages = document.getElementById('items');
    const newMessage = document.getElementById('item_name');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
