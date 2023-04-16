<template>
  <v-container class="d-flex justify-center">
    <v-card class="mb-16" max-width="800px">
      <v-card-title>
        <v-img height="80" src="@/assets/bootawrite.png"></v-img>
        <span class="text-h5 font-weight-bold mb-10">글 수정하기</span>
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="12" sm="12" md="6">
            <v-text-field
              v-model="board.btb_title"
              id="btb_title"
              name="btb_title"
              ref="btb_title"
              label="제목"
              required
            ></v-text-field>
          </v-col>
          <v-col cols="12" sm="12" md="6"> </v-col>
          <v-col cols="12" sm="12" md="12">
            <v-textarea
              auto-grow
              filled
              label="내용"
              id="btb_content"
              name="btb_content"
              placeholder="내용을 입력하세요"
              v-model="board.btb_content"
            ></v-textarea>
          </v-col>

          <v-col rows="3" cols="12" md="6">
            <v-text-field
              label="글을 작성할때 설정한 비밀번호를 입력하세요*"
              type="password"
              name="btb_pw"
              id="btb_pw"
              v-model="btb_pw"
              required
            ></v-text-field>
          </v-col>

          <v-col cols="12" sm="6">
            <v-autocomplete
              :items="[
                '서울',
                '수도권',
                '지방',
                '아파트',
                '매매',
                '행복주택',
                '귀농',
                '주식',
                '코인',
              ]"
              label="관심"
              multiple
            ></v-autocomplete>
          </v-col>
        </v-row>

        <small>*삭제시 비밀번호가 필요합니다</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="updateBoota()">
          수정하기
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      btb_pw: "",
      board: [],
    };
  },
  created() {
    let btbno = this.$route.params.btbno;

    http.get("/boota/" + btbno).then(({ data }) => {
      console.log(data);
      this.board = data.board;
    });
  },
  methods: {
    updateBoota() {
      if (this.btb_pw == this.board.btb_pw) {
        http
          .put("/boota/" + this.board.btbno, {
            btb_content: this.board.btb_content,
            btb_pw: this.board.btb_pw,
            btb_read_count: this.board.btb_read_count,
            btb_title: this.board.btb_title,
            btb_write_date: this.board.btb_write_date,
            btbno: this.board.btbno,
            guguncode: this.board.guguncode,
            like_count: this.board.like_count,
          })
          .then((resp) => {
            console.log(resp);
            alert("수정이 완료되었습니다.");
            this.moveList();
          });
      } else {
        alert("비밀번호를 확인하세요");
      }
    },
    moveList() {
      this.$router.push({ path: "/boota/" });
    },
  },
};
</script>

<style></style>
