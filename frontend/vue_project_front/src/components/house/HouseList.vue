<template>
  <div>
    <div v-if="houses && houses.length != 0">
      <v-list style="max-height: 500px" dense class="overflow-y-auto">
        <house-list-item
          style="width: 350px"
          v-for="(house, index) in houses"
          :key="index"
          :house="house"
        />
      </v-list>
    </div>
    <div v-else>
      <v-alert border="right" color="green" elevation="3" outlined type="info"
        >지역을 선택해 주세요</v-alert
      >
    </div>
  </div>
</template>

<script>
import HouseListItem from "@/components/house/HouseListItem.vue";
import { mapState } from "vuex";

export default {
  name: "HouseList",
  components: {
    HouseListItem,
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(["houses"]),
    // houses() {
    //   return this.$store.state.houses;
    // },
  },
};
</script>

<style></style>
