const app = new Vue({
  el: '#container',
  data: {
    show: true,
    health: 0,
    armour: 0,
    stamina: 0
  },
  created: function() {
    window.addEventListener('message', this.setupMessageListener);
  },
  methods: {
    setupMessageListener(event) {
      const item = event.data;

      this.show = !item.show;
      this.health = item.health;
      this.armour = item.armour;
      this.stamina = item.stamina;
    }
  }
})