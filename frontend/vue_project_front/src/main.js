import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import vuetify from "./plugins/vuetify";
import "material-design-icons-iconfont/dist/material-design-icons.css";
import Vuetify from "vuetify/lib";

Vue.use(Vuetify);
Vue.config.productionTip = false;

new Vue({
  icons: {
    iconfont: "md",
  },
  router,
  store,
  vuetify,
  render: (h) => h(App),
}).$mount("#app");
