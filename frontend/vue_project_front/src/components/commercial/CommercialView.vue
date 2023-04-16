<template>
  <div class="around">
    <div class="d-flex justify-center mb-6">
      <v-tabs>
        <v-tab @click="foodChange">음식</v-tab>
        <v-tab @click="playChange">여가</v-tab>
        <v-tab @click="studyChange">교육</v-tab>
      </v-tabs>
    </div>

    <div v-if="foodVisible">
      <v-simple-table id="food-list">
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-center">이름</th>
              <th class="text-center">업종</th>
              <th class="text-center">주소</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(food, index) in FPaginatedData" :key="index">
              <td>{{ food.bizesNm }}</td>
              <td>{{ food.indsSclsNm }}</td>
              <td>{{ food.lnoAdr }}</td>
            </tr>
          </tbody></template
        >
      </v-simple-table>
      <div class="btn-cover">
        <v-btn
          :disabled="pageNum === 0"
          @click="prevPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          이전
        </v-btn>
        <span class="page-count"
          >{{ pageNum + 1 }} / {{ foodPageCount }} 페이지</span
        >
        <v-btn
          :disabled="pageNum >= foodPageCount - 1"
          @click="nextPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          다음
        </v-btn>
      </div>
    </div>

    <div v-if="playVisible">
      <v-simple-table id="play-list">
        <template v-slot:default>
          <thead>
            <tr>
              <th>이름</th>
              <th>업종</th>
              <th>주소</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(play, index) in PPaginatedData" :key="index">
              <td>{{ play.bizesNm }}</td>
              <td>{{ play.indsSclsNm }}</td>
              <td>{{ play.lnoAdr }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <div class="btn-cover">
        <v-btn
          :disabled="pageNum === 0"
          @click="prevPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          이전
        </v-btn>
        <span class="page-count"
          >{{ pageNum + 1 }} / {{ playPageCount }} 페이지</span
        >
        <v-btn
          :disabled="pageNum >= playPageCount - 1"
          @click="nextPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          다음
        </v-btn>
      </div>
    </div>

    <div v-if="studyVisible">
      <v-simple-table id="study-list">
        <template v-slot:default>
          <thead>
            <tr>
              <th>이름</th>
              <th>업종</th>
              <th>주소</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(study, index) in SPaginatedData" :key="index">
              <td>{{ study.bizesNm }}</td>
              <td>{{ study.indsSclsNm }}</td>
              <td>{{ study.lnoAdr }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <div class="btn-cover">
        <v-btn
          :disabled="pageNum === 0"
          @click="prevPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          이전
        </v-btn>
        <span class="page-count"
          >{{ pageNum + 1 }} / {{ StudyPageCount }} 페이지</span
        >
        <v-btn
          :disabled="pageNum >= StudyPageCount - 1"
          @click="nextPage"
          class="page-btn"
          fab
          dark
          small
          color="primary"
        >
          다음
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CommercialView",
  data() {
    return {
      plays: [],
      foods: [],
      studys: [],
      foodVisible: true,
      playVisible: false,
      studyVisible: false,
      gugun: "",
      playOn: false,
      foodOn: false,
      studyOn: false,
      //
      pageNum: 0,
      pageSize: 10,
    };
  },
  computed: {
    check() {
      return this.$store.state.gugun_code;
    },
    checkfood() {
      return this.$store.state.foodcommer;
    },
    checkplay() {
      return this.$store.state.playcommer;
    },
    checkstudy() {
      return this.$store.state.studycommer;
    },
    ////////////////////////////
    foodPageCount() {
      let listLeng = this.foods.length,
        listSize = this.pageSize,
        page = Math.floor(listLeng / listSize);

      if (listLeng % listSize > 0) page += 1;

      return page;
    },
    FPaginatedData() {
      const start = this.pageNum * this.pageSize,
        end = start + this.pageSize;

      return this.foods.slice(start, end);
    },
    //////////////////////////
    playPageCount() {
      let listLeng = this.plays.length,
        listSize = this.pageSize,
        page = Math.floor(listLeng / listSize);

      if (listLeng % listSize > 0) page += 1;

      return page;
    },
    PPaginatedData() {
      const start = this.pageNum * this.pageSize,
        end = start + this.pageSize;

      return this.plays.slice(start, end);
    },
    ////////////
    StudyPageCount() {
      let listLeng = this.studys.length,
        listSize = this.pageSize,
        page = Math.floor(listLeng / listSize);

      if (listLeng % listSize > 0) page += 1;

      return page;
    },
    SPaginatedData() {
      const start = this.pageNum * this.pageSize,
        end = start + this.pageSize;

      return this.studys.slice(start, end);
    },
  },
  watch: {
    check(val) {
      this.foodOn = false;
      this.playOn = false;
      this.studyOn = false;
      let info = {
        LCD: "Q",
        gugunCode: val,
      };
      (this.gugun = val), this.$store.dispatch("getFoodList", info);
      this.foodOn = true;
    },
    checkfood(val) {
      this.foods = val;
    },
    checkplay(val) {
      this.plays = val;
    },
    checkstudy(val) {
      this.studys = val;
    },
  },
  created() {},
  methods: {
    foodChange() {
      let info = {
        LCD: "Q",
        gugunCode: this.gugun,
      };
      this.playVisible = false;
      this.studyVisible = false;
      this.foodVisible = true;
      if (this.foodOn == false) {
        this.$store.dispatch("getFoodList", info);
        this.foodOn = true;
      }
    },
    playChange() {
      let info = {
        LCD: "N",
        gugunCode: this.gugun,
      };
      this.playVisible = true;
      this.studyVisible = false;
      this.foodVisible = false;
      if (this.playOn == false) {
        this.$store.dispatch("getPlayList", info);
        this.playOn = true;
      }
    },
    studyChange() {
      let info = {
        LCD: "R",
        gugunCode: this.gugun,
      };
      this.playVisible = false;
      this.studyVisible = true;
      this.foodVisible = false;
      if (this.studyOn == false) {
        this.$store.dispatch("getStudyList", info);
        this.studyOn = true;
      }
    },
    nextPage() {
      this.pageNum += 1;
    },
    prevPage() {
      this.pageNum -= 1;
    },
  },
};
</script>

<style>
/* table {
  width: 100%;
  border-collapse: collapse;
}
table th {
  font-size: 1.2rem;
}
table tr {
  height: 2rem;
  text-align: center;
  border-bottom: 1px solid #505050;
}
table tr:first-of-type {
  border-top: 2px solid #404040;
}
table tr td {
  padding: 1rem 0;
  font-size: 1.1rem;
} */
.btn-cover {
  margin-top: 1.5rem;
  text-align: center;
}
.btn-cover .page-btn {
  /* width: 5rem;
  height: 2rem;
  letter-spacing: 0.5px; */
}
.btn-cover .page-count {
  padding: 0 1rem;
}
</style>
