const app = new Vue({
  el: '#container',
  data: {
    show: true,
    health: 0,
    armour: 0,
    stamina: 0,
    healthMoveInterval: null
  },
  created: function() {
    window.addEventListener('message', this.setupMessageListener);
  },
  methods: {
    setupMessageListener(event) {
      const item = event.data;

      this.show = !item.show;
      this.moveHealthBar(item.health);
      this.health = item.health;
      this.armour = item.armour;
      this.stamina = item.stamina;
    },
    moveHealthBar(health) {
      const barElement = document.getElementById('health-bar-internal');

      barElement.style.width = `${health}%`;
      // this.healthMoveInterval = setInterval(frame, 10);

      // function frame() {
      //   barElement.style.width 

      //   if (width >= 100) {
      //     clearInterval(id);
      //     i = 0;
      //   } else {
      //     width++;
      //     barElement.style.width = width + "%";
      //   }
      // }
    }
  }
})