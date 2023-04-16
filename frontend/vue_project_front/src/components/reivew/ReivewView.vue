<template>
  <div>
    <v-row>
      <v-col cols="4">
        <v-card height="250px">
          <v-card-title primary-title class="d-flex justify-center mb-1">
            <div class="star-rating">
              <input
                type="radio"
                id="5-stars"
                name="rating"
                value="5"
                v-model="ratings"
              />
              <label for="5-stars" class="star">★</label>
              <input
                type="radio"
                id="4-stars"
                name="rating"
                value="4"
                v-model="ratings"
              />
              <label for="4-stars" class="star">★</label>
              <input
                type="radio"
                id="3-stars"
                name="rating"
                value="3"
                v-model="ratings"
              />
              <label for="3-stars" class="star">★</label>
              <input
                type="radio"
                id="2-stars"
                name="rating"
                value="2"
                v-model="ratings"
              />
              <label for="2-stars" class="star">★</label>
              <input
                type="radio"
                id="1-star"
                name="rating"
                value="1"
                v-model="ratings"
              />
              <label for="1-star" class="star">★</label>
            </div>
          </v-card-title>

          <!-- <v-row style="position: absolute; width: 400px; left: 40%"> -->
          <v-card-text>
            <input
              type="text"
              id="reivewTitle"
              name="reivewTitle"
              placeholder="제목을 입력하세요."
              v-model="reivewTitle"
            />
          </v-card-text>
          <v-card-text>
            <input
              type="text"
              id="reivew"
              name="reivew"
              placeholder="리뷰를 입력하세요."
              v-model="reivew"
            />
          </v-card-text>
          <v-card-actions class="mt-5">
            <v-spacer></v-spacer>
            <v-btn
              class="mx-1"
              fab
              dark
              small
              color="indigo"
              @click="writeReivew"
            >
              <v-icon dark> mdi-plus </v-icon>
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col>
        <v-card class="overflow-y-auto" height="250px">
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-center" width="20%">리뷰제목</th>
                  <th class="text-center" width="55%">리뷰내용</th>
                  <th class="text-center" width="15%">별점</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(rv, index) in reivews" :key="index">
                  <td>{{ rv.reivew_title }}</td>
                  <td>{{ rv.reivew_content }}</td>
                  <td>
                    <div class="star-ratings">
                      <div
                        class="star-ratings-fill space-x-2 text-lg"
                        :style="{
                          width: ratingToPercent(rv.reivew_rating) + '%',
                        }"
                      >
                        <span>★</span><span>★</span><span>★</span><span>★</span
                        ><span>★</span>
                      </div>
                      <div class="star-ratings-base space-x-2 text-lg">
                        <span>★</span><span>★</span><span>★</span><span>★</span
                        ><span>★</span>
                      </div>
                    </div>
                  </td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      reivews: [],
      ratings: "",
      reivew: "",
      reivewTitle: "",
      houseNum: "",
    };
  },
  computed: {
    checkhouse() {
      return this.$store.state.house;
    },
  },
  watch: {
    ratings(val) {
      console.log(val);
    },
    checkhouse(val) {
      console.log(val);
      this.houseNum = val.일련번호;
      this.setReivew(this.houseNum);
    },
  },
  methods: {
    setReivew(hno) {
      console.log(hno);

      http.get("/reivew/" + hno).then(({ data }) => {
        console.log(data);
        this.reivews = data.reivew;
        console.log(this.reivews);
      });
    },
    writeReivew() {
      http
        .post("/reivew", {
          house_num: this.houseNum,
          reivew_title: this.reivewTitle,
          reivew_rating: this.ratings,
          reivew_content: this.reivew,
        })
        .then(({ data }) => {
          console.log(data);
          this.setReivew(this.houseNum);
        });
    },
    ratingToPercent(rate) {
      console.log(rate);
      const score = +rate * 20;
      console.log(score);
      return score + 1.5;
    },
  },
};
</script>

<style>
/* 동적 별 */
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}

.star-rating input {
  display: none;
}

.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}

.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

/* 정적 별 */
.star-ratings {
  color: #aaa9a9;
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}

.star-ratings-base {
  z-index: 0;
  padding: 0;
}

input {
  border-bottom: #2b2a29;
}
</style>
