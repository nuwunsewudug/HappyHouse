<template>
  <div>
    <v-divider></v-divider>
    <v-footer padless>
      <v-card flat tile class="lighten-1 text-center" width="100vw">
        <v-card-text>
          <v-btn v-for="icon in icons" :key="icon" class="mx-4" icon>
            <v-icon size="24px">
              {{ icon }}
            </v-icon>
          </v-btn>
        </v-card-text>

        <v-card-text class="pt-0"> Contact us</v-card-text>

        <v-card-text>
          {{ new Date().getFullYear() }} — <strong>SSAFY</strong>
        </v-card-text>
      </v-card>
    </v-footer>
  </div>
</template>

<script>
export default {
  data: () => ({
    icons: ["mdi-facebook", "mdi-twitter", "mdi-linkedin", "mdi-instagram"],
  }),
  name: "FooterView",
};
</script>

<style></style>
