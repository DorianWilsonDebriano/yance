import consumer from "./consumer";

const initSportsClassChatroomCable = () => {
  const sportsClassMessagesContainer = document.getElementById('sports-class-messages');
  if (sportsClassMessagesContainer) {
    const id = sportsClassMessagesContainer.dataset.sportsClassChatroomId;

    consumer.subscriptions.create({ channel: "SportsClassChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        sportsClassMessagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initSportsClassChatroomCable };

