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
    const html = `
    <div class="d-flex flex-wrap">
    <div>${data.content.name}</div>
    <div><%= image_tag ${data.content.image} %></div>
    <div>${data.content.store}</div>
    </div>`;
    const messages = document.getElementById('items');
    const newMessage = document.getElementById('item_name');
    const newImage = document.getElementById('item_image');
    const newStore = document.getElementById('item_store')
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    newImage.value='';
    newStore.value=''
    location.reload(false);
  }
});
