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
  mounted: function () {
    setTimeout(() => {
      
    this.moveHealthBar(100);
    this.moveArmour(50);
    this.moveStamina(30);
    }, 2000);
  },
  methods: {
    setupMessageListener(event) {
      const item = event.data;

      this.moveHealthBar(item.health);
      this.moveArmour(item.armour);
      this.moveStamina(item.stamina);

      this.show = !item.show;
    },
    moveHealthBar(health) {
      if (health <= 0) {
        health = 0;
      }

      this.health = health;

      const barElement = document.getElementById('health-bar-internal');

      if (barElement) {
        barElement.style.width = `${health}%`;
      }
    },
    moveArmour(armour) {
      if (armour <= 0) {
        armour = 0;
      }

      this.armour = armour;

      const barElement = document.getElementById('armour-bar-internal');

      if (barElement) {
        barElement.style.width = `${armour}%`;
      }
    },
    moveStamina(stamina) {
      if (stamina <= 0) {
        stamina = 0;
      }

      this.stamina = stamina;

      const barElement = document.getElementById('stamina-bar-internal');

      if (barElement) {
        barElement.style.width = `${stamina}%`;
      }
    }
  }
})