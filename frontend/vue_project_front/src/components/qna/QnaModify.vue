<template>
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="700"
    max-height="10000"
  >
    <v-img height="80" src="@/assets/qnawrite.png"></v-img>

    <v-card-text>
      <v-row align="center" class="mx-0">
        <v-col>
          <div class="black--text">
            <v-text-field
              type="text"
              id="btitle"
              name="btitle"
              v-model="board.btitle"
              ref="btitle"
              label="제목 "
              placeholder="질문 제목을 입력하세요"
            ></v-text-field>
          </div>
        </v-col>
      </v-row>

      <v-row>
        <v-col>
          <div class="black--text">
            <v-textarea
              label="내용"
              id="bcontent"
              name="bcontent"
              v-model="board.bcontent"
              ref="bcontent"
              background-color="amber lighten-4"
              color="orange orange-darken-4"
            ></v-textarea>
          </div>
        </v-col>
      </v-row>
    </v-card-text>
    <v-row class="d-flex justify-5">
      <v-card-text class="ml-3">
        <div class="grey--text">작성일 : {{ board.bwrite_date }}</div>

        <div class="grey--text my-3 text-subtitle-5">
          작성자 : {{ board.bwriter }}
        </div>
      </v-card-text>
    </v-row>
    <v-card-text class="d-flex justify-space-around mb-6">
      <v-btn class="writeFormBtn submit" @click="modifyBoard">수정</v-btn>
      <v-btn class="writeFormBtn list indigo white--text" @click="moveList"
        >목록으로</v-btn
      >
    </v-card-text>
  </v-card>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  data() {
    return {
      board: {},
    };
  },
  created() {
    let bno = this.$route.params.bno;

    http.get("/board/" + bno).then(({ data }) => {
      //console.log(data.board);
      this.board = data.board;
    });
  },
  methods: {
    moveList() {
      this.$router.push({ path: "/qna/list" });
    },
    modifyBoard() {
      http
        .put("/board/" + this.board.bno, {
          bno: this.board.bno,
          btitle: this.board.btitle,
          bwriter: this.board.bwriter,
          bwrite_date: this.board.bwrite_date,
          bcontent: this.board.bcontent,
        })
        .then((resp) => {
          console.log(resp);
          alert("수정이 완료되었습니다.");
          this.moveList();
        });
    },
  },
};
</script>

<style></style>
