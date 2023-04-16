<template>
  <div>
    <router-view></router-view>
    <h2 class="text-center"><b>Map</b></h2>
    <v-container class="fill-height" fluid>
      <house-search-bar></house-search-bar>
    </v-container>

    <v-row style="height: 600px">
      <v-col cols="3" class="ml-10 mr-2"><house-list /></v-col>
      <v-col cols="8"><KakaoMap /></v-col>
    </v-row>
    <v-row style="height: 1000px">
      <v-col class="ml-7" cols="3" style="margin: 0px 20px"
        ><house-detail
      /></v-col>
      <v-col cols="8"
        ><reivew-view style="margin-bottom: 40px" /> <commercial-view
      /></v-col>
    </v-row>

    <!-- <b-container class="bv-example-row mt-3 text-center">
      <b-row>
        <b-col>
          <house-search-bar></house-search-bar>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="6" align="left">
          <house-list />
        </b-col>
        <b-col cols="6">
          <house-detail />
        </b-col>
      </b-row> -->

    <!-- 맵 -->
    <!-- <b-row>
        <b-col cols="12"><KakaoMap /></b-col>
      </b-row> -->
    <!-- 맵 끝 -->
    <!-- 리뷰 -->
    <!-- <b-row>
        <b-col cols="12">
          <reivew-view />
        </b-col>
      </b-row> -->
    <!-- 리뷰 끝 -->
    <!-- 주변 상권 -->
    <!-- <b-row style="margin-top: 100px">
        <b-col cols="12">
          <commercial-view />
        </b-col>
      </b-row> -->
    <!-- 상권 끝 -->
    <!-- </b-container> -->
  </div>
</template>
<script>
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import HouseList from "@/components/house/HouseList.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";
import KakaoMap from "@/components/map/KakaoMap.vue";
import ReivewView from "@/components/reivew/ReivewView.vue";
import CommercialView from "@/components/commercial/CommercialView.vue";

export default {
  name: "HouseView",
  components: {
    HouseSearchBar,
    HouseList,
    HouseDetail,
    KakaoMap,
    ReivewView,
    CommercialView,
  },
};
</script>

<style scoped>
.text-center {
  font-size: 50px;
}
.container {
  width: 50%;
  margin-top: 35px;
}
</style>
