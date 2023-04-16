<template>
  <v-app>
    <v-main>
      <nav-view></nav-view>

      <router-view />
      <footer-view></footer-view>
    </v-main>
  </v-app>
</template>

<script>
import NavView from "@/components/common/NavView";

import FooterView from "./components/common/FooterView.vue";
export default {
  name: "App",
  components: { NavView, FooterView },
  data: () => ({}),
};
</script>
