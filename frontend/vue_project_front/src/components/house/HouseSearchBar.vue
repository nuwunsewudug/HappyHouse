<template>
  <div class="searchBar d-flex justify-end mb-6">
    <v-container>
      <v-row align="center">
        <v-col class="d-flex">
          <v-select
            v-model="sidoCode"
            :items="sidos"
            label="시/도 선택"
            dense
            @change="gugunList"
          ></v-select>
        </v-col>
        <v-col class="d-flex">
          <v-select
            v-model="gugunCode"
            :items="guguns"
            label="구/군 선택"
            dense
            @change="searchApt"
          ></v-select>
        </v-col>
      </v-row>
    </v-container>
    <!-- <b-row class="mt-4 mb-4 text-center">
      <b-col class="sm-3">
        <b-form-select
          v-model="sidoCode"
          :options="sidos"
          @change="gugunList"
        ></b-form-select>
      </b-col>
      <b-col class="sm-3">
        <b-form-select
          v-model="gugunCode"
          :options="guguns"
          @change="searchApt"
        ></b-form-select>
      </b-col> -->

    <!-- <b-col class="sm-3">
      <b-form-select
        v-model="DongCode"
        :options="guguns"
        @change="searchApt"
      ></b-form-select>
    </b-col> -->
    <!-- </b-row> -->
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

export default {
  name: "HouseSearchBar",
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
      sidoName: "",
      gugunName: "",
    };
  },
  computed: {
    ...mapState(["sidos", "guguns", "houses"]),
    // sidos() {
    //   return this.$store.state.sidos;
    // },
  },
  created() {
    // this.$store.dispatch("getSido");
    // this.sidoList();
    this.CLEAR_SIDO_LIST();
    this.getSido();
  },
  methods: {
    ...mapActions([
      "getSido",
      "getGugun",
      "getHouseList",
      "getSidoName",
      "getGugunName",
    ]),
    ...mapMutations(["CLEAR_SIDO_LIST", "CLEAR_GUGUN_LIST"]),
    // sidoList() {
    //   this.getSido();
    // },

    //
    check() {
      this.$store.dispatch("getStoreList", this.gugunCode);
    },
    //

    gugunList() {
      this.CLEAR_GUGUN_LIST();
      this.gugunCode = null;
      if (this.sidoCode) this.getSidoName(this.sidoCode);
      if (this.sidoCode) this.getGugun(this.sidoCode);
    },
    searchApt() {
      console.log(this.gugunCode);
      if (this.gugunCode) this.getGugunName(this.gugunCode);
      if (this.gugunCode) this.getHouseList(this.gugunCode);
      this.$emit("gugunCode", this.gugunCode);
    },
  },
};
</script>

<style>
.searchBar {
  width: 100%;
}
</style>
